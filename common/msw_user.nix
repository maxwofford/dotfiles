{ config, pkgs, ... }:
{
  # Define a user account. Don't forget to set a password with 'passwd'.
  users.users.msw = {
    isNormalUser = true;
    extraGroups = [
      "wheel" # Enable 'sudo' for the user.
      "networkmanager"
    ];

    openssh.authorizedKeys.keys = builtins.attrValues(import ./ssh_keys.nix);
  };
}
