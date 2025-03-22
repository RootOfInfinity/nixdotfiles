{
  programs.nushell = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/nix --impure";
      upgrade = "sudo nixos-rebuild switch --flake ~/nix --impure --upgrade";
      homebuild = "home-manager switch --flake ~/nix";
      cd = "z";
    };
    extraConfig = /*nu*/ ''
      $env.config.show_banner = false
      $env.config.buffer_editor = "hx"
      $env.config.edit_mode = "vi"
      $env.PROMPT_INDICATOR_VI_NORMAL = ":NORMAL> "
      $env.PROMPT_INDICATOR_VI_INSERT = ""
      use ~/.cache/starship/init.nu

      source ~/.zoxide.nu
    '';
    envFile.text = /*nu*/ ''
      mkdir ~/.cache/starship
      starship init nu | save -f ~/.cache/starship/init.nu

      zoxide init nushell | save -f ~/.zoxide.nu #try init nushell if it don work
    '';
  };
}
