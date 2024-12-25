#!/usr/bin/env bash

# init wallpaper daemon
swww-daemon &
# set wallpaper
swww img ~/nix/home-manager/files/nix-wallpaper.png &

#for managing network
nm-applet --indicator &

# the BAR
waybar &

# for notifs
mako
