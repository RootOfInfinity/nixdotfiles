{ config, pkgs, pkgs-unstable,  ... }: {
  home.stateVersion = "25.05";

  
  imports = [
    ../../home-manager/mainhome.nix
  ];

  stylix.fonts.sizes = {
    # applications = 14;
    # desktop = 14;
    # terminal = 10;
    # popups = 14;
  };

}
