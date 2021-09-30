{ lib, ... }: {
  # This file was populated at runtime with the networking
  # details gathered from the active system.
  networking = {
    nameservers = [ "8.8.8.8"
 ];
    defaultGateway = "137.184.96.1";
    defaultGateway6 = "2604:a880:400:d0::1";
    dhcpcd.enable = false;
    usePredictableInterfaceNames = lib.mkForce false;
    interfaces = {
      eth0 = {
        ipv4.addresses = [
          { address="137.184.105.28"; prefixLength=20; }
{ address="10.10.0.5"; prefixLength=16; }
        ];
        ipv6.addresses = [
          { address="2604:a880:400:d0::1c0f:e001"; prefixLength=64; }
{ address="fe80::2cd2:b4ff:fe19:5354"; prefixLength=64; }
        ];
        ipv4.routes = [ { address = "137.184.96.1"; prefixLength = 32; } ];
        ipv6.routes = [ { address = "2604:a880:400:d0::1"; prefixLength = 128; } ];
      };
      
    };
  };
  services.udev.extraRules = ''
    ATTR{address}=="2e:d2:b4:19:53:54", NAME="eth0"
    ATTR{address}=="76:07:63:4e:f4:91", NAME="eth1"
  '';
}
