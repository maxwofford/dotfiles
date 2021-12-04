# This expects credentials to be found in /etc/nixos/smb-secrets
# username=REPLACEME
# password=REPLACEME

{ config, pkgs, ... }:
{
  imports = [ ./tailscale.nix ];

  security.wrappers."mount.nfs".source = "${pkgs.nfs-utils.out}/bin/mount.nfs";

  fileSystems."/mnt/watermelon" = {
    device = "//watermelon/data";
    fsType = "cifs";
    options = let
      # this line prevents hanging on network split
      automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-5s";
    in ["${automount_opts},credentials=/etc/nixos/smb-secrets"];
  };
}
