# set screen resolution
~/bin/auto_monitor.sh

# set colorscheme
xsetroot -bg black
xrdb -load ~/.Xresources

# dbus
dbus-update-activation-environment --systemd DISPLAY

# screensaver
xscreensaver -nosplash &

# audio
start-pulseaudio-x11

# toolbar
nm-applet &
~/.config/polybar/launch-polybar.sh &

# startup apps
alacritty -e tmux new-session -A -s main &

# numlock
numlockx on

# wm
exec bspwm 2>&1 > ~/.config/bspwm/logs
