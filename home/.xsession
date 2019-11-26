# set screen resolution
if [ $(autorandr --detected) -ne $(autorandr --current) ]
then
    sleep 2
    autorandr -c
    sleep 5
fi

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
~/.config/polybar/launch.sh &

# startup apps
alacritty -e tmux new-session -A -s main &

# wm
exec bspwm 2>&1 > ~/.config/bspwm/logs
