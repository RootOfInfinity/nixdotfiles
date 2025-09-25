{ config, pkgs, pkgs-unstable,  ... }: {
  home.stateVersion = "25.05";

  
  imports = [
    ../../home-manager/mainhome.nix
  ];

  stylix.fonts.sizes = {
    applications = 12;
    desktop = 12;
    terminal = 10;
    popups = 10;
  };

}
