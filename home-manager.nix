{ config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.msw = {
    /* Here goes your home-manager config, eg home.packages = [ pkgs.foo ]; */
    programs.bash = {
      enable = true;
      enableVteIntegration = true;
      initExtra = ''
        echo "You find yourself wandering through a forest..."
        '';
    };

    programs.git = {
      userName = "Max Wofford";
      userEmail = "max@maxwofford.com";
    };

    programs.vim = {
      enable = true;
      settings = {
        number = true;
      };
    };
  };
}
