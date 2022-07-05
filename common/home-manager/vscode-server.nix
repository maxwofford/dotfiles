
{ ... }: {
  imports = [
    "${
      fetchTarball
      "https://github.com/msteen/nixos-vscode-server/tarball/178c809a9dbd3f4df25ed7fbe23a52c35233502d"
    }/modules/vscode-server/home.nix"
  ];
}
