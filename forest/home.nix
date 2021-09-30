{
  imports = [
    /home/msw/.dotfiles/common/home-manager.nix
  ];

  home-manager.users.msw = {
    programs.bash = {
      initExtra = ''
        echo "You find yourself wandering through a forest..."
      '';
    };
  };
}
