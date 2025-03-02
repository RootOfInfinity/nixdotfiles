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

  dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-uri-dark = "file://${pkgs.nixos-artwork.wallpapers.nineish-dark-gray.src}";
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome.gnome-themes-extra;
    };
  };
}
