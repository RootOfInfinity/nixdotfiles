{ config, pkgs, pkgs-unstable, pkgs-old, ... }: {
  home = {
    username = "rootofinfinity";
    homeDirectory = "/home/rootofinfinity";
    stateVersion = "24.11";

    packages = [
      pkgs.cmatrix
      pkgs.nsnake
      pkgs-unstable.flatpak
      pkgs-unstable.gnome-software
    ];

  };
  
  imports = [
    ./modules/bundle.nix
  ];
  programs.librewolf = {
    enable = true;
    settings = {
      "webgl.disabled" = false;
    };
  };

}
