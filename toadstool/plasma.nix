{ ... }: {
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;
}
