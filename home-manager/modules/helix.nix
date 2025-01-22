{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    languages = {
      language = [{
        name = "rust";
        auto-format = true;
      }];
    };
    settings = {
      editor = {
        line-number = "relative";
        lsp.display-messages = true;
      };
      keys.normal = {
        esc = [ "keep_primary_selection" "collapse_selection" ];
      };
      keys.insert = {
        "C-space" = "completion";
      };
    };
  };
}
