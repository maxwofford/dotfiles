{...}:
{
  systemd.services.fall = {
    enable = true;
    description = "Run a status checker for Fall service.";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
    serviceConfig = {
      ExecStart = ''
        /run/current-system/sw/bin/node \
          /home/msw/dev/fall/server.js
        '';
      Environment = "DATA_DIR=/home/msw/dev/fall/data";
      Restart = "always";
      RestartSec = "10";
      ExecStop = "/bin/kill -s STOP $MAINPID";
      ExecReload = "/bin/kill -s HUP $MAINPID";
      RemainAfterExit = "yes";
      User = "msw";
    };
  };
}

