{ config, pkgs, lib, ... }: {
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix

    /home/msw/.dotfiles/toadstool/home.nix
    /home/msw/.dotfiles/toadstool/fall.nix
    # /home/msw/.dotfiles/toadstool/gnome.nix
    /home/msw/.dotfiles/toadstool/plasma.nix
    # /home/msw/.dotfiles/toadstool/steam.nix
    /home/msw/.dotfiles/toadstool/nfs-share.nix

    /home/msw/.dotfiles/common/msw_user.nix
    /home/msw/.dotfiles/common/tailscale.nix
    /home/msw/.dotfiles/common/aria2daemon.nix
    /home/msw/.dotfiles/common/watermelon.nix
    /home/msw/.dotfiles/common/status_badge.nix
    /home/msw/.dotfiles/common/cron.nix
    /home/msw/.dotfiles/common/fail2ban.nix

    # /home/msw/.dotfiles/fern/home-assistant.nix
  ];

  networking.hostName = "toadstool";
  time.timeZone = "America/New_York";
  networking.firewall.allowPing = true;
  services.openssh.enable = true;

  # GC, optimize, free up space from nix store
  nix.autoOptimiseStore = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
  # free up to 1GiB whenever there is less than 100MiB left:
  nix.extraOptions = ''
    min-free = ${toString (100 * 1024 * 1024)}
    max-free = ${toString (1024 * 1024 * 1024)}
  '';

  # Enable avahi (bonjour) for finding watermelon.local
  services.avahi = {
    enable = true;
    nssmdns = true;
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Framework laptop recommended settings
  boot.kernelPackages = pkgs.linuxPackages_latest; # for WiFi support
  boot.kernelParams = [ "mem_sleep_default=deep" ];
  # networking.wireless.enable = true;  # conflicts with  networkmanager
  networking.networkmanager.enable = true;

  # CPU throttling
  services.tlp.enable = true;
  services.power-profiles-daemon.enable = false;
  # Battery power management
  services.upower.enable = true;

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  # networking.interfaces.enp0s13f0u1u3.useDHCP = true;
  # ^ See https://github.com/NixOS/nixpkgs/issues/107908#issuecomment-882549381

  networking.nameservers = [ "1.1.1.1" ];

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;
  services.xserver.libinput.touchpad.naturalScrolling = false;

  # Docker
  # virtualisation.docker.enable = true;
  # users.extraGroups.docker.members = [ "msw" ];

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    pv # monitor dd progress
    zoom-us
    htop
    gtop
    wget
    git
    gh
    mosh
    tldr
    dconf2nix
    nodejs
    yarn
    nodePackages.npm
    nixfmt
    unzip
    heroku
    docker-compose
    vlc
    bundler
    ruby
    yt-dlp
    terminator
    tilda
    dig

    postman

    # virt-manager
    # qemu_xen-light
    # xen-light

    geckodriver
    firefox
    google-chrome
    # brave # managed by home-manager

    spotify

    krita
    blender
    prusa-slicer

    slack
    discord
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?

}

