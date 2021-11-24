{ config, ... }:

{
  services.tailscale.enable = true;
  networking.firewall.trustedInterfaces = [ "tailscale0" ];
  networking.firewall.allowedUDPPorts = [
    config.services.tailscale.port
  ];
  networking.extraHosts =
    ''
      100.115.193.119 forest
      100.103.124.128 water-lily
      100.64.232.97 angel-trumpet
      100.113.78.4 guava
      100.81.20.86 sequoia
      100.96.50.76 watermelon
      100.76.38.42 rubber
      100.64.63.40 toadstool
      100.118.73.5 sugarcane
    '';
}
