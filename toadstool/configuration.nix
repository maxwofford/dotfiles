# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
let
  unstable = import (builtins.fetchTarball
    "https://github.com/nixos/nixpkgs/tarball/nixos-unstable")
  # reuse the current configuration
    { config = config.nixpkgs.config; };
in {
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix

    /home/msw/.dotfiles/toadstool/home.nix
    # /home/msw/.dotfiles/toadstool/gnome.nix
    /home/msw/.dotfiles/toadstool/plasma.nix

    /home/msw/.dotfiles/common/msw_user.nix
    /home/msw/.dotfiles/common/tailscale.nix
    /home/msw/.dotfiles/common/aria2daemon.nix
    /home/msw/.dotfiles/common/watermelon.nix
    /home/msw/.dotfiles/common/status_badge.nix
  ];

  nixpkgs.config.allowUnfree = true;

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

  networking.hostName = "toadstool"; # Define your hostname.

  # Set your time zone.
  time.timeZone = "America/New_York";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  # networking.interfaces.enp0s13f0u1u3.useDHCP = true;
  # ^ See https://github.com/NixOS/nixpkgs/issues/107908#issuecomment-882549381

  networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;

  # Enable plasma desktop manager
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;
  services.xserver.libinput.touchpad.naturalScrolling = false;

  # Docker
  virtualisation.docker.enable = true;
  users.extraGroups.docker.members = [ "msw" ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    htop
    wget
    git
    gh
    mosh
    tldr
    dconf2nix
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

    virt-manager
    qemu_xen-light
    xen-light

    firefox
    google-chrome
    # brave # managed by home-manager

    spotify

    krita
    blender
    prusa-slicer

    slack
    discord

    unstable.github-desktop
  ];

  # programs.dconf.enable = true;
  # virtualisation.libvirtd.enable = true;
  # users.extraGroups.libvirtd.members = [ "msw" ];
  # boot.kernelModules = [ "kvm-amd" "kvm-intel" ];

  # virtualisation.virtualbox.host.enable = true;
  # virtualisation.virtualbox.host.enableExtensionPack = true;
  # users.extraGroups.vboxusers.members = [ "msw" ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

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

