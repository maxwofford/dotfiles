{ pkgs, ... }:
{
 systemd.services.aria2Daemon= {
  wantedBy = [ "multi-user.target" ]; 
  after = [ "network.target" ];
  description = "Aria2c download manager.";
  serviceConfig = {
    ExecStart = ''
      /run/current-system/sw/bin/aria2c \
        --enable-rpc \
        --rpc-listen-all \
        --daemon=true \
        --dir=/home/msw/Downloads
    '';
    ExecStop="/bin/kill -s STOP $MAINPID";
    ExecReload="/bin/kill -s HUP $MAINPID";
    RemainAfterExit="yes";
    User = "msw";
  };
 };

 environment.systemPackages = [ pkgs.aria2 ];
}