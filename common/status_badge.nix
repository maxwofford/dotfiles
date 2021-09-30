{ config, ... }:
{
  imports = [
    /home/msw/.dotfiles/common/tailscale.nix
  ];

  services.nginx = {
    enable = true;

    virtualHosts."$hostname" = {
      locations."/status-badge" = {
        return = "200 'online'";
      };
    };
  };
}
