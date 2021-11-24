{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  programs.vscode = {
    # This is enabled on a per-host basis
    # enable = true; # Did you read the comment?
    package = pkgs.vscode;
    extensions = with pkgs.vscode-extensions; [
      davidanson.vscode-markdownlint
      bbenoist.Nix
      eamodio.gitlens
      vscodevim.vim
    ];
  };
}