{ config, pkgs, pkgs-unstable,  ... }: {
  home.packages = [
      pkgs.cmatrix
      pkgs.nsnake
      pkgs-unstable.flatpak
      pkgs-unstable.gnome-software
      pkgs.gnome-themes-extra
    ];

  imports = [ ./modules/bundle.nix ];
  # Dont need this no more, since I got the stylix module
  dconf.settings = {
  #   "org/gnome/desktop/background" = {
  #     picture-uri-dark = "file://${pkgs.nixos-artwork.wallpapers.nineish-dark-gray.src}";
  #   };
  #   "org/gnome/desktop/interface" = {
  #     color-scheme = "prefer-dark";
  #   };
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };
  gtk.enable = true;

  # gtk = {
  #   enable = true;
  #   theme = {
  #     name = "Adwaita-dark";
  #     package = pkgs.gnome.gnome-themes-extra;
  #   };
  # };
}
