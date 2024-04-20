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

    # /home/msw/.dotfiles/common/aria2daemon.nix
    /home/msw/.dotfiles/common/tailscale.nix
    /home/msw/.dotfiles/common/status_badge.nix
    /home/msw/.dotfiles/common/msw_user.nix
    /home/msw/.dotfiles/common/cron.nix
    /home/msw/.dotfiles/common/fail2ban.nix
    # /home/msw/.dotfiles/common/server_daemon.nix
  ];

  boot.tmp.cleanOnBoot = true;
  networking.hostName = "forest";
  networking.firewall.allowPing = true;
  services.openssh.enable = true;
  system.autoUpgrade = {
    enable = true;
    allowReboot = true;
    channel = https://nixos.org/channels/nixos-22.11-small;
  };

  # GC, optimize, free up space from nix store
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
  # free up to 1GiB whenever there is less than 100MiB left:
  nix.extraOptions = ''
    min-free = ${toString (100 * 1024 * 1024)}
    max-free = ${toString (1024 * 1024 * 1024)}
  '';

  environment.systemPackages = with pkgs; [
    gtop
    git
    mosh
    vim
    wget
    tldr
    nixfmt
    dig

    google-chrome
  ];
  nixpkgs.config.allowUnfree = true;

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

        # locations."/upload" = {
        #   proxyPass = "http://127.0.0.1:3000";
        #   extraConfig = ''
        #     client_max_body_size 100M;
        #   '';
        # };

        # locations."/screenshot" = {
        #   proxyPass = "http://127.0.0.1:3000";
        #   extraConfig = ''
        #     client_max_body_size 100M;
        #   '';
        # };

        # locations."/storage/" = {
        #   proxyPass = "http://127.0.0.1:3000";
        #   extraConfig = ''
        #     proxy_hide_header 'Cache-Control';
        #     add_header 'Cache-Control' "public, max-age=259200";
        #   '';
        # };

        locations."/".return = "302 https://github.com/maxwofford/dotfiles/tree/nixos";
      };
    };
  };
}
