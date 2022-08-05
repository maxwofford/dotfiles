{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    yarn
  ];
  systemd.services.server_daemon = {
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
    description = "Assemble file upload server.";
    serviceConfig = {
      ExecStart = ''
        /run/current-system/sw/bin/yarn start
      '';
      WorkingDirectory="/home/msw/dev/file-upload-server";
      ExecStop="/bin/kill -s STOP $MAINPID";
      ExecReload="/bin/kill -s HUP $MAINPID";
      RemainAfterExit = "yes";
      Restart = "always";
      User = "msw";
    };
  };
}