{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./networking.nix # generated at runtime by nixos-infect
    ./host.nix
    /home/msw/.dotfiles/common/tailscale.nix
    /home/msw/.dotfiles/common/status_badge.nix

    /home/msw/.dotfiles/common/msw_user.nix

    /home/msw/.dotfiles/forest/home.nix
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
  ];

  networking.firewall.allowedTCPPorts = [ 80 443 ];

  services.nginx = {
    enable = true;

    virtualHosts = {
      "forest.maxwofford.com" = {
        locations."/".return = "302 https://github.com/maxwofford/dotfiles";

        locations."/status-badges/forest" = {
          proxyPass = "http://forest/status-badge";
        };

        locations."/status-badges/water-lily" = {
          proxyPass = "http://water-lily/status-badge";
        };
      };

      "$hostname" = {
        locations."/status-badges/forest" = {
          proxyPass = "http://forest/status-badge";
        };

        locations."/status-badges/water-lily" = {
          proxyPass = "http://water-lily/status-badge";
        };
      };
    };
  };
}
