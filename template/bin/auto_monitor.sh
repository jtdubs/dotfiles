#!/bin/bash

if [ x"$(autorandr --detected)" == x"$(autorandr --current)" ]
then
    echo Monitor setup already correct.
    exit 0
else
    echo Auto-detecting monitor setup...
    autorandr -c
    sleep 2
    bspc desktop any -m primary
    bspc monitor -d 1 2 3 4 5 6 7 8 9 0
    feh --auto-zoom --bg-fill ~/.local/share/backgrounds/hardy_blue.png
    pactl set-card-profile 0 output:hdmi-stereo-extra1 || pactl set-card-profile 0 output:analog-surround-40
fi
