{ pkgs, lib, ... }:
let
  v21_11 = import
    (builtins.fetchTarball "https://github.com/nixos/nixpkgs/tarball/21.11") {
      config.allowUnfree = true;
    };
in {
  nixpkgs.config.allowUnfree = true;

  programs.vscode = {
    # This is enabled on a per-host basis
    # enable = true; # Did you read the comment?
    package = pkgs.vscode;
    extensions = lib.mkMerge [
      (with pkgs.vscode-extensions; [
        davidanson.vscode-markdownlint
        bbenoist.Nix
        brettm12345.nixfmt-vscode
        ms-azuretools.vscode-docker
        eamodio.gitlens
        vscodevim.vim
      ])
      (with v21_11.pkgs.vscode-extensions; [ github.copilot ])
    ];
  };
}
