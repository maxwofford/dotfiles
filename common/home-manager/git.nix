{ ... }: {
  programs.git = {
    enable = true;
    userName = "Max Wofford";
    userEmail = "max@maxwofford.com";

    extraConfig = {
      init = { defaultBranch = "main"; };
      pull = { rebase = true; };
      merge = { conflictstyle = "diff3"; };
    };

    ignores = [
      # not even once!
      ".env"
      "*.log"
      "*.sqlite"
      "*.sql"
      ".DS_Store"
      # vim
      "*.swp"
    ];
  };
}