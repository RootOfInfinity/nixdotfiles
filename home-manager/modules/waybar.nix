{
  programs.waybar = {
    enable = true;
    settings = {
# -*- mode: jsonc -*-
    mainBar = {
        layer = "top";
        position = "top"; 
        #// Waybar height (to be removed for auto height)
        height = 30;
        # // "width": 1280, // Waybar width
        spacing = 16; #// Gaps between modules (4px;
        # // Choose the order of the modules
        modules-left = [
            # "wlr/taskbar"
            # "group/quicklinks"
            # "hyprland/window"
        ];
        modules-center = [
        ];
        modules-right = [
            "pulseaudio"
            "network"
            "cpu"
            "memory"
            "keyboard-state"
            "clock"
            "tray"
            "custom/power"
        ];
        # // Modules configuration
        keyboard-state = {
            numlock = true;
            capslock = true;
            format = ":{name}{icon}:";
            format-icons = {
                locked = "";
                unlocked = "";
            };
        };
        tray = {
            icon-size = 21;
            spacing = 20;
        };
        clock = {
            timezone = "America/Chicago";
            format = "{:%I:%M %p}";
            tooltip-format = "<big>{:%Y %B %d}</big>\n<tt><small>{calendar}</small></tt>";
            format-alt = "{:%Y-%m-%d}";
        };
        cpu = {
            interval = 10;
            format = "{usage}% ";
            tooltip = false;
        };
        memory = {
            format = "{percentage}% ";
        };
        network = {
            # // "interface": "wlp2*", // (Optional) To force the use of this interface
            format-wifi = "{essid} ({signalStrength}%) ";
            format-ethernet = "{ipaddr}/{cidr}";
            tooltip-format = "{ifname} via {gwaddr} ";
            format-linked = "{ifname} (No IP) ";
            format-disconnected = "Disconnected ⚠";
            format-alt = "{ifname}: {ipaddr}/{cidr}";
        };
        pulseaudio = {
            # // "scroll-step": 1, // %, can be a float
            format = "{volume}% {icon}";
            format-bluetooth = "{volume}% {icon} {format_source}";
            format-bluetooth-muted = " {icon} {format_source}";
            format-muted = " {format_source}";
            # format-source = "{volume}% ";
            format-source-muted = "";
            format-icons = {
                headphone = "";
                hands-free = "";
                headset = "";
                phone = "";
                portable = "";
                car = "";
                default = ["" "" ""];
            };
            on-click = "pwvucontrol";
        };
        "custom/media" = {
            format = "{icon} {text}";
            return-type = "json";
            max-length = 40;
            format-icons = {
                spotify = "";
                default = "🎜";
            };
            escape = true;
            # exec = "$HOME/.config/waybar/mediaplayer.py 2> /dev/null"; # // Script in resources folder
            # // "exec" = "$HOME/.config/waybar/mediaplayer.py --player spotify 2> /dev/null" // Filter player based on name
        };
        "custom/power" = {
            format = "⏻ ";
        		tooltip = false;
            on-click = "wlogout";
        };

    };  
    };
    style = /*css*/ ''
        * {
            border: none;
            border-radius: 0;
            font-family: BigBlueTermPlus Nerd Font Mono;
            font-size: 13px;
            min-height: 0;
        }
        window#waybar {
            background-color: rgba(43, 48, 59, 0.5);
            border-bottom: 3px solid rgba(100, 114, 125, 0.5);
            color: #FFFFFF;
        }

        tooltip {
            background: rgba(43, 48, 59, 0.5);
            border: 1px solid rgba(100, 114, 125, 0.5);
        }

        tooltip label {
            color: white;
        }

        #pulseaudio {
            border: 1px solid rgba(100, 114, 125, 0.5);
            border-radius: 0.25; 
        }

        #mode, #clock {
            padding: 0 10px;
        }

        #mode {
            background: #64727D;
            border-bottom: 3px solid white;
        }

        #clock, #pulseaudio, #cpu, #memory, #keyboard-state {
            background-color: #64727D;
            border-radius: 20;
            padding: 5px;
        }


    '';
  };
}
