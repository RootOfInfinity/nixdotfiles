{ config, pkgs, pkgs-unstable,  ... }: {
  home.stateVersion = "25.05";

  
  imports = [
    ../../home-manager/mainhome.nix
  ];

  stylix.fonts.sizes = {
    applications = 10;
    desktop = 6;
    terminal = 6;
    popups = 12;
  };
}
