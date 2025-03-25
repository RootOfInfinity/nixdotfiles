{
  programs.alacritty = {
    enable = true;
    settings = {
      terminal.shell = "nu";
      # font = {
      #   normal = {
      #     family = "BigBlueTermPlus Nerd Font Mono";
      #     style = "Regular";
      #   };
      # };
      window = {
        # opacity = 0.8;
        blur = true;
      };
    };
  };
}
