{
  imports = [
    /home/msw/.dotfiles/common/home-manager.nix
  ];

  home-manager.users.msw = {
    programs.bash = {
      initExtra = ''
        echo "Water lily"
      '';
    };

    programs.rofi = {
      enable = true;
      extraConfig = {
        modi = "drun,emoji,ssh";
      };
      theme = "sidebar";
      #theme = "Adapta-Nokto";
    };
  };
}
