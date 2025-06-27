{
  programs.hyprlock = {
    enable = true;
    settings = {
      background = {
        # path = "screenshot";
        # This is done by stylix
        blur_passes = 2;        
      };
      label = [
        {
          text = "Good Morning, $USER";
          position = "0, 100";
          halign = "center";
          valign = "center";
          font_family = "BigBlueTerm Plus Nerd Font Mono";
          font_size = 40;
        }
        {
          text = "cmd[update:1000] echo '$TIME12'";
          font_size = 40; 
          font_family = "BigBlueTerm Plus Nerd Font Mono";
          halign = "right";
          valign = "bottom";
          position = "-200, 100";
        }
      ];
    };
  };
}
