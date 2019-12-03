#!/bin/sh

# set screen resolution
~/bin/auto_monitor.sh

# compositing
compton --backend glx --paint-on-overlay --refresh-rate 60 --glx-no-stencil --glx-no-rebind-pixmap --glx-swap-method -1 &
compton --opacity-rule 95:'name *= "qutebrowser"'

# basic config
feh --bg-fill /usr/share/backgrounds/Ubuntu_80s_glitch_by_Abubakar_NK.jpg
# xsetroot -bg black
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
