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

  services.nginx = {
    enable = true;

    locations."/status-badges/(?<slug>.+)$" = {
      proxyPass = "://$slug/status-badge"
    }
  }
}
