Welcome to my NixOS dotfiles!
-----------------------------

I'm a bit of a beginner in NixOS and ricing, so it is definitely not the
best setup.  However, if you want something relatively simple, this is a
decent starting point.  A lot of my configuration assumes that the main user
is `rootofinfinity`, and that the flake (And the rest of the config) is in
`~/nix`. The `configuration.nix` file is very bloated and I should probably
cut it up into multiple files soon.  If you don't want `rootofinfinity` as
your main user, you can change all instances of `rootofinfinity` to whatever
your username is.   

If you want to run my system, heres how ya do it.

1. Use `git clone` to clone my repo into your files.
2. `cd` into the folder.
3. Run `sudo nixos-rebuild switch --flake . --impure`
4. You should now have a `rootofinfinity` user.
5. `cp` the repo into `/home/rootofinfinity/` and `cd` into it.
6. Rename the folder holding the repo to "nix" using `mv`.
7. Become `rootofinfinity` with `su`.
  * It would be a great idea to change the password with `passwd` too.
8. Run `home-manager switch --flake .`.
9. Do a `reboot` just to make sure everything is super clean.
10. Login to `rootofinfinity` on startup, and run `Hyprland` (NOT SUDO).
  * Enjoy!
  * The default Terminal uses Nushell by default, if you dont like that you can either:
    1. Run `bash` when starting a terminal.
    2. Change that behavior in `/home-manager/bundles/alacritty.nix`.

##### Default Keybinds

I might change the config without updating the README, so the most updated list of
keybind changes is going to be in the `/home-manager/bundles/hyprland.nix` file, but
I want to at least try to put it here. 

From here on out, SUPER refers to the Windows key.

 | Controls               | Action                                         |
 |:-----------------------|:-----------------------------------------------|
 | SUPER+Q                | Open Alacritty                                 |
 | SUPER+C                | Kills active window                            |
 | SUPER+E                | Opens GUI File manager                         |
 | SUPER+F                | Opens TUI File manager                         |
 | SUPER+V                | Makes it a floating window                     |
 | SUPER+R                | Opens the Rofi Menu                            |
 | PRINT                  | Screenshots a clicked monitor                  |
 | SUPER+PRINT            | Screenshots a clicked window                   |
 | SUPER+SHIFT+PRINT      | Screenshots a selected part of your screen     |
 | SUPER+U                | Splits horizontally instead of vertically      |
 | SUPER+H                | Move focus left                                |
 | SUPER+L                | Move focus right                               |
 | SUPER+K                | Move focus up                                  |
 | SUPER+J                | Move focus down                                |
 | SUPER+SHIFT+H          | Resize focused window left                     |
 | SUPER+SHIFT+L          | Resize focused window right                    |
 | SUPER+SHIFT+K          | Resize focused window up                       |
 | SUPER+SHIFT+J          | Resize focused window down                     |
 | SUPER+CTRL+H           | Move window left                               |
 | SUPER+CTRL+L           | Move window right                              |
 | SUPER+CTRL+K           | Move window up                                 |
 | SUPER+CTRL+J           | Move window down                               |
 | SUPER+Number           | Moves to the specified workspace number        |
 | SUPER+SHIFT+Number     | Moves window to the specified workspace number |
 | SUPER+LeftMouseButton  | Moves window with mouse                        |
 | SUPER+RightMouseButton | Resizes window with mouse                      |

###### Last updated README 2025-03-03

