{ config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball
    "https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz";
in {
  imports = [ (import "${home-manager}/nixos") ];

  home-manager.users.msw = { pkgs, config, ... }: {
    home.stateVersion = "23.11";
    imports = [
      ./bash.nix
      ./brave.nix
      ./dig.nix
      ./git.nix
      ./vim.nix
      ./rofi.nix
      # ./vs-code.nix
      # ./vscode-server.nix
    ];
  };
}
