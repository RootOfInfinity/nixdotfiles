{
  programs.yazi = {
    enable = true;
    enableNushellIntegration = true;
    settings = {
      opener = {
        play = [{
          run = "mpv \"$n\"";
          orphan = true;
          for = "unix";
        }];
        edit = [{
          run = "hx \"$@\"";
          block = true;
          for = "unix";
        }];
      };
    };
  };
}
