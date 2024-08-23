{
  imports = [
    /home/msw/.dotfiles/common/home-manager
  ];

  home-manager.users.msw = {
    programs.bash = {
      initExtra = ''
        echo "You find yourself wandering through a forest..."
      '';
    };
    #services.vscode-server.enable = true;
  };
}
