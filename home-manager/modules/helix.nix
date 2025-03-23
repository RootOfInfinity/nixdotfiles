{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    languages = {
      language = [
      {
        name = "rust";
        auto-format = true;
        # indent = { tab-width = 4; unit = " "; };
      }
      {
        name = "nix";
        auto-format = true;
        # indent = { tab-width = 4; unit = " "; };
      }
      {
        name = "markdown";
        auto-format = true;
        indent = { tab-width = 4; unit = " "; };
      }
      ];
    };
    settings = {
      theme = "autumn";
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
