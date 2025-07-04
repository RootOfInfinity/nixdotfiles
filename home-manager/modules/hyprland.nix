{ hyprland, hyprsplit, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    # withUWSM = true;
    xwayland.enable = true;


    ###############
    ### PLUGINS ###
    ###############

    plugins = [
      # split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
      # hyprsplit.packages.default
      # pkgs.hyprlandPlugins.hyprsplit
    ];

    # package = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;

    settings = {
# This is an example Hyprland config file.
# Refer to the wiki for more information.
# https://wiki.hyprland.org/Configuring/

# Please note not all available settings / options are set here.
# For a full list, see the wiki

# You can split this configuration into multiple files
# Create your files separately and then link them to this file like this:
# source = ~/.config/hypr/myColors.conf


################
### MONITORS ###
################

# See https://wiki.hyprland.org/Configuring/Monitors/
monitor = [
  "HDMI-A-1, 1920x1080, 0x0, 1"
  "DP-1, 1920x1080, 1920x0, 1"
];

workspace = [
  "1, monitor:HDMI-A-1"
  "2, monitor:HDMI-A-1"
  "3, monitor:HDMI-A-1"
  "4, monitor:HDMI-A-1"
  "5, monitor:HDMI-A-1"
  "6, monitor:DP-1"
  "7, monitor:DP-1"
  "8, monitor:DP-1"
  "9, monitor:DP-1"
  "10, monitor:DP-1"
];

###################
### MY PROGRAMS ###
###################

# See https://wiki.hyprland.org/Configuring/Keywords/

# Set programs that you use
"$terminal" = "alacritty";
"$fileManager" = "alacritty -e yazi";
"$guiFileManager" = "thunar";
"$menu" = "rofi -show drun -show-icons";


#################
### AUTOSTART ###
#################

# Autostart necessary processes (like notifications daemons, status bars, etc.)
# Or execute your favorite apps at launch like this:

exec-once = [
  "bash ~/nix/home-manager/scripts/start.sh"
  "hyprctl setcursor Bibata-Modern-Classic 24"
  "hyprctl dispatch workspace 1"
  "mpv --no-video ~/nix/home-manager/files/PremonitionStartupSound.mp3" 
  "[workspace special:quick_term silent] alacritty --class 'floatcritty' -e nu -e fastfetch"
  # "~/nix/home-manager/eww/scripts/music_too_long.sh"
];
# exec-once = $terminal
# exec-once = nm-applet &
# exec-once = waybar & hyprpaper & firefox


#############################
### ENVIRONMENT VARIABLES ###
#############################

# See https://wiki.hyprland.org/Configuring/Environment-variables/

env = [
  "HYPRCURSOR_SIZE,24"
  "XCURSOR_SIZE,24"
];




#####################
### LOOK AND FEEL ###
#####################

# Refer to https://wiki.hyprland.org/Configuring/Variables/

# https://wiki.hyprland.org/Configuring/Variables/#general
general = {
    gaps_in = 5;
    gaps_out = 20;

    border_size = 2;

    # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
    # "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
    # "col.inactive_border" = "rgba(595959aa)";

    # Set to true enable resizing windows by clicking and dragging on borders and gaps
    resize_on_border = false;

    # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
    allow_tearing = false;

    layout = "dwindle";
};

# https://wiki.hyprland.org/Configuring/Variables/#decoration
decoration = {
    rounding = 10;

    # Change transparency of focused and unfocused windows
    active_opacity = 1.0;
    inactive_opacity = 1.0;

    shadow = {
        enabled = true;
        range = 4;
        render_power = 3;
        # color = "rgba(1a1a1aee)";
    };

    # https://wiki.hyprland.org/Configuring/Variables/#blur
    blur = {
        enabled = true;
        size = 3;
        passes = 1;

        vibrancy = 0.1696;
    };
};

# https://wiki.hyprland.org/Configuring/Variables/#animations
animations = {
    enabled = "yes, please :)";

    # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

    bezier = [
      "easeOutQuint,0.23,1,0.32,1"
      "easeInOutCubic,0.65,0.05,0.36,1"
      "linear,0,0,1,1"
      "almostLinear,0.5,0.5,0.75,1.0"
      "quick,0.15,0,0.1,1"
    ];

    animation = [
      "global, 1, 10, default"
      "border, 1, 5.39, easeOutQuint"
      "windows, 1, 4.79, easeOutQuint"
      "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
      "windowsOut, 1, 1.49, linear, popin 87%"
      "fadeIn, 1, 1.73, almostLinear"
      "fadeOut, 1, 1.46, almostLinear"
      "fade, 1, 3.03, quick"
      "layers, 1, 3.81, easeOutQuint"
      "layersIn, 1, 4, easeOutQuint, fade"
      "layersOut, 1, 1.5, linear, fade"
      "fadeLayersIn, 1, 1.79, almostLinear"
      "fadeLayersOut, 1, 1.39, almostLinear"
      "workspaces, 1, 1.94, almostLinear, fade"
      "workspacesIn, 1, 1.21, almostLinear, fade"
      "workspacesOut, 1, 1.94, almostLinear, fade"
    ];
};

# Ref https://wiki.hyprland.org/Configuring/Workspace-Rules/
# "Smart gaps" / "No gaps when only"
# uncomment all if you wish to use that.
# workspace = w[tv1], gapsout:0, gapsin:0
# workspace = f[1], gapsout:0, gapsin:0
# windowrulev2 = bordersize 0, floating:0, onworkspace:w[tv1]
# windowrulev2 = rounding 0, floating:0, onworkspace:w[tv1]
# windowrulev2 = bordersize 0, floating:0, onworkspace:f[1]
# windowrulev2 = rounding 0, floating:0, onworkspace:f[1]

# See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
dwindle = {
    pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
    preserve_split = true; # You probably want this
};

# See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
master = {
    new_status = "master";
};

# https://wiki.hyprland.org/Configuring/Variables/#misc
misc = {
    force_default_wallpaper = -1; # Set to 0 or 1 to disable the anime mascot wallpapers
    disable_hyprland_logo = true; # If true disables the random hyprland logo / anime girl background. :(
};


#############
### INPUT ###
#############

# https://wiki.hyprland.org/Configuring/Variables/#input
input = {
    kb_layout = "us";
    # kb_variant =
    # kb_model =
    # kb_options =
    # kb_rules =

    follow_mouse = 1;

    sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

    touchpad = {
        natural_scroll = false;
    };
};

# https://wiki.hyprland.org/Configuring/Variables/#gestures
gestures = {
    workspace_swipe = false;
};

# Example per-device config
# See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
device = {
    name = "epic-mouse-v1";
    sensitivity = -0.5;
};


###################
### KEYBINDINGS ###
###################

# See https://wiki.hyprland.org/Configuring/Keywords/
"$mainMod" = "SUPER"; # Sets "Windows" key as main modifier

# Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
bind = [
  "$mainMod, Q, exec, $terminal"
  "$mainMod, C, killactive,"
  "$mainMod, M, exit,"
  "$mainMod, E, exec, $guiFileManager"
  # "$mainMod, F, exec, $fileManager"
  "$mainMod, F, fullscreen, 0"
  "$mainMod, V, togglefloating,"
  "$mainMod, R, exec, $menu"
  "$mainMod, T, exec, killall wlogout; wlogout"
  "$mainMod, P, exec, hyprlock"
  "$mainMod, D, exec, eww close powermenu; eww open powermenu"
  "$mainMod, ESCAPE, exec, eww close powermenu"
  "$mainMod, W, exec, hyprpicker | wl-copy"


  # "$mainMod, P, pseudo," # dwindle"
  "$mainMod, PRINT, exec, hyprshot -m window -o ~/Pictures/Screenshots -z"
  " , PRINT, exec, hyprshot -m output -o ~/Pictures/Screenshots"
  "$mainMod SHIFT, PRINT, exec, hyprshot -m region -o ~/Pictures/Screenshots -z"
  "$mainMod, U, togglesplit, # dwindle"
  # "$mainMod, S, split:swapactiveworkspaces"
  # "$mainMod, W, exec, ~/nix/home-manager/scripts/reload-waybar.sh"
  # Move focus with mainMod + hjkl
  "$mainMod, H, movefocus, l"
  "$mainMod, L, movefocus, r"
  "$mainMod, K, movefocus, u"
  "$mainMod, J, movefocus, d"
  # Gonna make movable + resizeable windows with keyboard.
  "$mainMod CTRL, H, resizeactive, -30 0"
  "$mainMod CTRL, L, resizeactive, 30 0"
  "$mainMod CTRL, K, resizeactive, 0 -30"
  "$mainMod CTRL, J, resizeactive, 0 30"

  "$mainMod SHIFT, H, movewindow, l"
  "$mainMod SHIFT, L, movewindow, r"
  "$mainMod SHIFT, K, movewindow, u"
  "$mainMod SHIFT, J, movewindow, d"
  
  # Switch workspaces with mainMod + [0-9]
  "$mainMod, 1, workspace, 1"
  "$mainMod, 2, workspace, 2"
  "$mainMod, 3, workspace, 3"
  "$mainMod, 4, workspace, 4"
  "$mainMod, 5, workspace, 5"
  "$mainMod, 6, workspace, 6"
  "$mainMod, 7, workspace, 7"
  "$mainMod, 8, workspace, 8"
  "$mainMod, 9, workspace, 9"
  "$mainMod, 0, workspace, 10"
  "$mainMod CTRL, 1, workspace, 11"
  "$mainMod CTRL, 2, workspace, 12"
  "$mainMod CTRL, 3, workspace, 13"
  "$mainMod CTRL, 4, workspace, 14"
  "$mainMod CTRL, 5, workspace, 15"

  # Move active window to a workspace with mainMod + SHIFT + [0-9]
  "$mainMod SHIFT, 1, movetoworkspace, 1"
  "$mainMod SHIFT, 2, movetoworkspace, 2"
  "$mainMod SHIFT, 3, movetoworkspace, 3"
  "$mainMod SHIFT, 4, movetoworkspace, 4"
  "$mainMod SHIFT, 5, movetoworkspace, 5"
  "$mainMod SHIFT, 6, movetoworkspace, 6"
  "$mainMod SHIFT, 7, movetoworkspace, 7"
  "$mainMod SHIFT, 8, movetoworkspace, 8"
  "$mainMod SHIFT, 9, movetoworkspace, 9"
  "$mainMod SHIFT, 0, movetoworkspace, 10"
  "$mainMod CTRL SHIFT, 1, movetoworkspace, 11"
  "$mainMod CTRL SHIFT, 2, movetoworkspace, 12"
  "$mainMod CTRL SHIFT, 3, movetoworkspace, 13"
  "$mainMod CTRL SHIFT, 4, movetoworkspace, 14"
  "$mainMod CTRL SHIFT, 5, movetoworkspace, 15"
  # Example special workspace (scratchpad)
  "$mainMod, S, togglespecialworkspace, quick_term"
  "$mainMod SHIFT, S, movetoworkspace, special:quick_term"
  # Scroll through existing workspaces with mainMod + scroll
  "$mainMod, mouse_down, workspace, e+1"
  "$mainMod, mouse_up, workspace, e-1"
];

bindm = [
  # Move/resize windows with mainMod + LMB/RMB and dragging
  "$mainMod, mouse:272, movewindow"
  "$mainMod, mouse:273, resizewindow"
];

bindel = [
  # Laptop multimedia keys for volume and LCD brightness
  ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
  ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
  ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
  ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
  ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
  ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
  # Requires playerctl
  ", XF86AudioNext, exec, playerctl next"
  ", XF86AudioPause, exec, playerctl play-pause"
  ", XF86AudioPlay, exec, playerctl play-pause"
  ", XF86AudioPrev, exec, playerctl previous"
  ", XF86AudioStop, exec, playerctl stop"
  # Laptop close
  ", switch:on:Lid Switch, exec, hyprlock & hyprctl dispatch dpms off"
  ", switch:off:Lid Switch, exec, hyprctl dispatch dpms on"
];

# bindl = [
#   # Requires playerctl
#   ", XF86AudioNext, exec, playerctl next"
#   ", XF86AudioPause, exec, playerctl play-pause"
#   ", XF86AudioPlay, exec, playerctl play-pause"
#   ", XF86AudioPrev, exec, playerctl previous"
# ];

##############################
### WINDOWS AND WORKSPACES ###
##############################

# See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
# See https://wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules

# Example windowrule v1
# windowrule = float, ^(kitty)$

# Example windowrule v2
# windowrulev2 = float,class:^(kitty)$,title:^(kitty)$

windowrule = [
  "float,class:^floatcritty$"
  "size 800 600,class:^floatcritty$"
  "move 100 100,class:^floatcritty$"
];
windowrulev2 = [
  # Ignore maximize requests from apps. You'll probably like this.
  "suppressevent maximize, class:.*"
  # Fix some dragging issues with XWayland
  "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
];

    };
  };
}
