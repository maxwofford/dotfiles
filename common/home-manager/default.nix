{ config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-21.05.tar.gz";
in
{
  imports = [ (import "${home-manager}/nixos") ];

  home-manager.users.msw = { pkgs, config, ... }: {
    imports = [
      ./bash.nix
      ./git.nix
      ./vim.nix
      ./rofi.nix
      ./vs-code.nix
    ];
  };
}