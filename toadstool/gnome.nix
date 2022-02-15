{ pkgs, ... }: {
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  environment.systemPackages = with pkgs; [
    gnomeExtensions.arcmenu
    gnomeExtensions.hot-edge
    gnomeExtensions.jiggle
    gnomeExtensions.printers
    gnomeExtensions.unite
    gnomeExtensions.freon
  ];
  #services.udev.packages = with pkgs; [ gnome3.gnome-settings-daemon ];
}
