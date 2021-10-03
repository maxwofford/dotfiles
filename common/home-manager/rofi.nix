{ ... }: {
  programs.rofi = {
    extraConfig = {
      modi = "drun,emoji,ssh";
      theme = "sidebar";
    };
  };
}