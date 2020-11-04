#!/bin/sh

# set screen resolution
if [ ! -e /usr/bin/vmtoolsd ]
then
    # not needed in a VM
    ~/bin/auto_monitor.sh
fi

# compositing
picom &

# basic config
feh --auto-zoom --bg-fill ~/.local/share/backgrounds/hardy_blue.png
# xsetroot -bg black
xsetroot -cursor_name left_ptr
xrdb -load ~/.Xresources
numlockx on

# startup services
dbus-update-activation-environment --systemd DISPLAY
if [ ! -e /usr/bin/vmtoolsd ]
then
    # not needed in a VM
    xscreensaver -nosplash &
fi
start-pulseaudio-x11

# toolbar
nm-applet &
~/.config/polybar/launch-polybar.sh &

# startup apps
# alacritty -e tmux new-session -A -s main &

# wm
exec bspwm 2>&1 > ~/.config/bspwm/logs-$DISPLAY
