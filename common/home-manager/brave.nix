{ ... }: {
  programs.brave = {
    # enable = true;
    extensions = [
      "aeblfdkhhhdcdjpifhhbdiojplfjncoa" # 1Password
      "dcgcnpooblobhncpnddnhoendgbnglpn" # Superhuman
      "eimadpbcbfnmbkopoojfekhnkhdbieeh" # Dark Reader
    ];
  };
}
