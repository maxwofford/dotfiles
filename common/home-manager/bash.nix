{ ... }: {
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
}