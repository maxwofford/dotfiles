
{ ... }: {
  imports = [
    "${
      fetchTarball
      "https://github.com/msteen/nixos-vscode-server/tarball/bc28cc2a7d866b32a8358c6ad61bea68a618a3f5"
    }/modules/vscode-server/home.nix"
  ];
}
