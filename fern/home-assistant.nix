{ ... }: {
  services.home-assistant = {
    enable = true;
    # Good starting config, that will get you through the configuration
    # flow, that has a hard dependency on a few components.
    #
    # Components might not actually have YAML configuration, but
    # mentioning them in the configuration will get their dependencies
    # loaded.
    config = {
      # https://www.home-assistant.io/integrations/default_config/
      default_config = { };
      # https://www.home-assistant.io/integrations/weather/
      weather = { };
      # https://www.home-assistant.io/integrations/nest/
      nest = { };
      # https://www.home-assistant.io/integrations/sonos/
      sonos = { };
      # https://www.home-assistant.io/integrations/homeassistant/
      # homeassistant = {
      #   name = "Hack Club HQ";
      #   unit_system = "imperial";
      #   time_zone = "EST";
      # };
      # frontend = {
      #   themes = "!include_dir_merge_named themes";
      # };
      # https://www.home-assistant.io/integrations/http/
      http = {
        login_attempts_threshold = 5;
      };
      # feedreader.urls = [ "https://nixos.org/blogs.xml" ];
    };
    # applyDefaultConfig = true;
    openFirewall = true;
  };
}