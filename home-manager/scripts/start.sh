#!/usr/bin/env bash

# init wallpaper daemon
swww init &
# set wallpaper
swww img ../files/nix-wallpaper.png &

#for managing network
nm-applet --indicator &

# the BAR
waybar &

# for notifs
mako
