{ pkgs, ... }:
{
  # most the stylix is in homemanager, this is pretty much just for the tty.
  stylix = {
    enable = true;
    autoEnable = true;
    homeManagerIntegration.autoImport = true;
    image = ../home-manager/files/rust-circuit-wallpaper.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    polarity = "either";
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 50;
    };
  };
}
