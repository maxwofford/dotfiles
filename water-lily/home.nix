{
  imports = [
    /home/msw/.dotfiles/common/home-manager
  ];

  home-manager.users.msw = {
    programs.bash = {
      initExtra = ''
        echo "Water lily"
      '';
    };

    programs.rofi = { enable = true; };

    programs.vscode = { enable = true; };
  };
}
