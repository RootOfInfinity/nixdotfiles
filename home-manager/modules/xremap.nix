{
  services.xremap = {
    withHypr = true;
    config = {
      keymap = [
        {
          name = "programming remap";
          remap = {
            CapsLock = {
              held = "leftctrl";
              alone = "esc";
              alone_timeout_millis = 150;
            };
          };
          application = {
            "only" = "alacritty";
          };
        }
      ];
    };
  };
}
