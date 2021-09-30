{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./networking.nix # generated at runtime by nixos-infect
    ./host.nix
    /home/msw/.dotfiles/common/tailscale.nix

    #<home-manager/nixos>
    /home/msw/.dotfiles/home-manager.nix
  ];

  boot.cleanTmpDir = true;
  networking.hostName = "forest";
  networking.firewall.allowPing = true;
  services.openssh.enable = true;

  environment.systemPackages = with pkgs; [
    gtop
    git
    mosh
    vim
    wget
    tldr
  ];

  users.users.msw = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  # home-manager.users.msw = { pkgs, ... }: {
  #   imports = [ /home/msw/.dotfiles/home-manager.nix ];
  #   # home.packages = [  ];
  #   # programs.bash.enable = true;
  # };

  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDA3udweyI6SLS1DEuPaQGTphP50h3LuySAqY/Te6sUrTKVO9+DomCtO+5qPb5OvPVoSR3fylFjh7NGxAd5QGsz8lCOYFj/zrjGtAOGb/EX7J0NP4k7QqoAB9Fiu1ArOWyNBdIqVnXrWcyCpnaym/63ofxsk4+B0qEXM1WMy20ltgT244clectYZCmDaQcI0IY7hQ6Y4g3/z9yYcRPIcgiWFksF6XdcA/wknBWis8W0YBBIgi7D87HhJlGpQh3e5qQ5CKfiZbh5cdgUqetEm578x6hXZVQnSjS7YvgkNsOmf4JpkU3toUe6g3zB/BYvLw1NO5nj7FA+EfwSvIUdrTsBlJJGGcAL4BF1afW9ipQd7t/onxEeCRhu3yrTWfllOfbjfQ0Y3eg15YU76WD9kPX5f2syOlEBAvBBSrwKiDLwYkb/u0d0kcmd1sYlrDBCcpN+slQszzbTfZF9zvqkVp9jAxpdZIVRCrh9n8kLG/4WzTXmVYAIgK43ezE3MvVv2bgbYxd1XqgG+Jx68zKnRBTI/fkUd1fo/khxaPWvYSZpmen7oQt1bB80YseLVpBNTgUKdw3bmasnPR3OawCihtRwM3PfUkl5mCBtGXX+PQrHWKMUL/Dh9+vUgzaT0kXOYm8ujDQ3nnIITDAsqJGXrcVMFipz/0iNhTdoSW0F7AmZ5w== max@guava" 
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII5bJhhyjxGBe/3cU7NzbLBuX6hFn+nkgx3HD/nNDf4B max@rubber" 
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPrhhYe/ARsSJ1X7dpQwQcWcaokODCkp6I8FBz9R+PBl max@maxwofford.com" 
  ];

  users.users.msw.openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDA3udweyI6SLS1DEuPaQGTphP50h3LuySAqY/Te6sUrTKVO9+DomCtO+5qPb5OvPVoSR3fylFjh7NGxAd5QGsz8lCOYFj/zrjGtAOGb/EX7J0NP4k7QqoAB9Fiu1ArOWyNBdIqVnXrWcyCpnaym/63ofxsk4+B0qEXM1WMy20ltgT244clectYZCmDaQcI0IY7hQ6Y4g3/z9yYcRPIcgiWFksF6XdcA/wknBWis8W0YBBIgi7D87HhJlGpQh3e5qQ5CKfiZbh5cdgUqetEm578x6hXZVQnSjS7YvgkNsOmf4JpkU3toUe6g3zB/BYvLw1NO5nj7FA+EfwSvIUdrTsBlJJGGcAL4BF1afW9ipQd7t/onxEeCRhu3yrTWfllOfbjfQ0Y3eg15YU76WD9kPX5f2syOlEBAvBBSrwKiDLwYkb/u0d0kcmd1sYlrDBCcpN+slQszzbTfZF9zvqkVp9jAxpdZIVRCrh9n8kLG/4WzTXmVYAIgK43ezE3MvVv2bgbYxd1XqgG+Jx68zKnRBTI/fkUd1fo/khxaPWvYSZpmen7oQt1bB80YseLVpBNTgUKdw3bmasnPR3OawCihtRwM3PfUkl5mCBtGXX+PQrHWKMUL/Dh9+vUgzaT0kXOYm8ujDQ3nnIITDAsqJGXrcVMFipz/0iNhTdoSW0F7AmZ5w== max@guava" 
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII5bJhhyjxGBe/3cU7NzbLBuX6hFn+nkgx3HD/nNDf4B max@rubber" 
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPrhhYe/ARsSJ1X7dpQwQcWcaokODCkp6I8FBz9R+PBl max@maxwofford.com" 
  ];
}
