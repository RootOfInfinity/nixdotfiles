{ pkgs, pkgs-unstable, config, ... }:
{
  stylix = {
    enable = true;
    autoEnable = true;
    # homeManagerIntegration.autoImport = true;
    image = ../files/CrossGruvbox.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    polarity = "dark";
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };
    fonts = {
      # serif = config.stylix.fonts.monospace;
      sansSerif = config.stylix.fonts.monospace;
      monospace = {
        package = pkgs-unstable.nerd-fonts.bigblue-terminal;
        name = "BigBlueTermPlus Nerd Font Mono";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };

    opacity.terminal = 0.9;
    opacity.applications = 0.9;

    targets.helix.enable = false;
  };
}
