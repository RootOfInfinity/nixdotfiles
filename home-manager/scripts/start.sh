#!/usr/bin/env bash


# new bar
eww daemon
eww open bar --id primary --arg monitor=1
eww open bar --id secondary --arg monitor=0
# init wallpaper daemon
swww-daemon &
# set wallpaper
swww img ~/nix/home-manager/files/CrossGruvbox.png &

#for managing network | not anymore
# nm-applet --indicator &

# the BAR (i no longer use waybar)


# for notifs
mako
