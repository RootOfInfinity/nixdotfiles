#!/usr/bin/env bash


# init wallpaper daemon
swww-daemon &
# set wallpaper
swww img ~/nix/home-manager/files/CrossGruvbox.png &
# for notifs
mako &
# new bar
eww daemon &
eww open bar --id primary --arg monitor=1 --arg type=laptop &
eww open bar --id secondary --arg monitor=0 --arg type=laptop

#for managing network | not anymore
# nm-applet --indicator &

# the BAR (i no longer use waybar)


