{ config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-21.05.tar.gz";
in
{
  # environment.systemPackages = with pkgs; [
  #   home-manager
  # ];

  # imports = [ <home-manager/nixos> ];
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
      sessionVariables = {
        EDITOR = "vim";
      };
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
        gap = "git add -p";

        nr = "sudo nixos-rebuild switch";
        ne = "vim ~/.dotfiles";

        quit = "exit";
        ":q" = "exit";
      };
    };

    programs.git = {
      enable = true;
      userName = "Max Wofford";
      userEmail = "max@maxwofford.com";

      extraConfig = {
        init = { defaultBranch = "main"; };
        pull = { rebase = true; };
      };

      ignores = [
        # not even once!
        ".env"
      ];
    };

    programs.vim = {
      enable = true;
      settings = {
        number = true;
      };
    };
  };
}
