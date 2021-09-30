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
      shellOptions = [
        "checkwinsize"
        "globstar"
        "histappend"
        "autocd"
        "checkjobs"
      ];
      shellAliases = {
        ll = "ls -alF";
        la = "ls -la";
        l = "ls -CF";

        mkdir = "mkdir -p";

        "..." = "cd ../..";
        "...." = "cd ../../..";
        "....." = "cd ../../../..";
        "......" = "cd ../../../../..";

        g = "git";
        gc = "git commit -m";
        gco = "git checkout -b";
        gd = "git diff";
        gdc = "git diff --cached";
        gs = "git status";
        gr = "git remote -v";
        gpull = "git pull --rebase";
        gpush = "git push";
        gb = "git branch -v";
        ga = "git add";

        quit = "exit";
        ":q" = "exit";
      };
      initExtra = ''
        echo "You find yourself wandering through a forest..."
        '';
    };

    programs.git = {
      enable = true;
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
