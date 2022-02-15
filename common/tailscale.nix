{ config, lib, ... }:
let
  authorizedIPs = import ./tailscale-ips.nix;
  authorizedIPsList = lib.attrsets.mapAttrsToList (name: value: value + " " + name) authorizedIPs;
in {
  services.tailscale.enable = true;
  networking.firewall.trustedInterfaces = [ "tailscale0" ];
  networking.firewall.allowedUDPPorts = [
    config.services.tailscale.port
  ];
  networking.extraHosts = ''

  # Added by common/tailscale.nix
  ${
    builtins.concatStringsSep "\n" authorizedIPsList
  }
  '';
}
