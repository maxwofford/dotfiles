{
  imports = [
    /home/msw/.dotfiles/common/home-manager
  ];

  home-manager.users.msw = {
    programs.bash = {
      initExtra = ''
        echo "A single toadstool stands out amongst fragile green blades of grass..."
      '';
    };
    services.vscode-server.enable = true;
  };
}
