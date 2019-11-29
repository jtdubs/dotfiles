#!/bin/sh

# set screen resolution
~/bin/auto_monitor.sh

# compositing
# compton &

# basic config
xsetroot -bg black
xsetroot -cursor_name left_ptr
xrdb -load ~/.Xresources
numlockx on

# startup services
dbus-update-activation-environment --systemd DISPLAY
xscreensaver -nosplash &
start-pulseaudio-x11

# toolbar
nm-applet &
~/.config/polybar/launch-polybar.sh &

# startup apps
alacritty -e tmux new-session -A -s main &

# wm
exec bspwm 2>&1 > ~/.config/bspwm/logs-$DISPLAY
