{ ... }:
let
  authorizedIPsList = builtins.attrValues(import ../common/tailscale-ips.nix)