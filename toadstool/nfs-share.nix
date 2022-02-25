{ pkgs, ... }: {
  services.nfs.server = {
    enable = true;
    # Tailscale IP for rubber, will open to more IPs in the future
    exports = ''
      / 100.76.38.42(all_squash,insecure,rw,sync,no_subtree_check,crossmnt,fsid=0)
      /home/msw 100.76.38.42(all_squash,anonuid=0,anongid=0,nohide,insecure,rw,sync,no_subtree_check)
    '';
    # fixed rpc.statd port for firewall
    lockdPort = 4001;
    mountdPort = 4002;
    statdPort = 4000;
  };
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 111 2049 4000 4001 4002 20048 ];
    allowedUDPPorts = [ 111 2049 4000 4001 4002 20048 ];
  };
}
