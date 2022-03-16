{ ... }: {
  imports = [
    /home/msw/.dotfiles/fern/hardware-configuration.nix # still needs to be committed
    /home/msw/.dotfiles/fern/home-assistant.nix
    /home/msw/.dotfiles/fern/home.nix

    /home/msw/.dotfiles/common/tailscale.nix
    /home/msw/.dotfiles/common/status_badge.nix
    /home/msw/.dotfiles/common/msw_user.nix
    /home/msw/.dotfiles/common/cron.nix
  ];

  networking.hostName = "fern";
  boot.cleanTmpDir = true;
  time.timeZone = "America/New_York";
  networking.firewall.allowPing = true;
  services.openssh.enable = true;
  
  system.autoUpgrade = {
    enable = true;
    allowReboot = true;
    channel = https://nixos.org/channels/nixos-21.11;
  };

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;

  networking.nameservers = [ "1.1.1.1" ];

  environment.systemPackages = with pkgs; [
    git
    gtop
    mosh
    tldr
    vim
    wget
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?
}
