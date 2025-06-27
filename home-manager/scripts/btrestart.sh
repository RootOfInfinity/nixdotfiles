#!/usr/bin/env bash
# I have 'jonno2002' to thank for this one.
# Truly saved me there bro.
# My bluetooth would not be the same without you.
# https://bbs.archlinux.org/viewtopic.php?id=272698

bluetoothctl power off
sudo systemctl stop bluetooth
sudo rfkill block bluetooth
sudo rfkill unblock bluetooth
sudo systemctl start bluetooth
sleep 1
bluetoothctl power on
exit 0
