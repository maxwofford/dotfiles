{ pkgs, ... }:
let
  authorizedKeysList = builtins.attrValues(import ../common/ssh_keys.nix);

  authorizedKeys = pkgs.writeTextDir "authorized_keys" ''
  # $ curl forest.maxwofford.com/authorized_keys >> ~/.ssh/authorized_keys

  # Build __store__ by forest.maxwofford.com

  ${
    builtins.concatStringsSep "\n" authorizedKeysList
  }
  '';

in {
  imports = [
    /home/msw/.dotfiles/forest/hardware-configuration.nix
    /home/msw/.dotfiles/forest/networking.nix # generated at runtime by nixos-infect
    /home/msw/.dotfiles/forest/home.nix

    /home/msw/.dotfiles/common/tailscale.nix
    /home/msw/.dotfiles/common/status_badge.nix
    /home/msw/.dotfiles/common/msw_user.nix
    /home/msw/.dotfiles/common/cron.nix
  ];

  boot.cleanTmpDir = true;
  networking.hostName = "forest";
  networking.firewall.allowPing = true;
  services.openssh.enable = true;

  environment.systemPackages = with pkgs; [
    gtop
    git
    mosh
    vim
    wget
    tldr
    nixfmt
  ];

  networking.firewall.allowedTCPPorts = [ 80 443 ];

  services.nginx = {
    enable = true;

    virtualHosts = {
      "forest.maxwofford.com" = {
        locations."=/status/forest" = {
          proxyPass = "http://forest/status-badge";
        };

        locations."=/status/water-lily" = {
          proxyPass = "http://water-lily/status-badge";
        };

        locations."=/status/toadstool" = {
          proxyPass = "http://toadstool/status-badge";
        };

        locations."=/authorized_keys" = {
          root = authorizedKeys;
          tryFiles = "/authorized_keys =404";
          extraConfig = ''
            sub_filter_types *;
            sub_filter __store__ ${authorizedKeys};
          '';
        };

        locations."/".return = "302 https://github.com/maxwofford/dotfiles/tree/nixos";
      };
    };
  };
}
