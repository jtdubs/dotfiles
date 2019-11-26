# set colorscheme
xsetroot -bg black
xrdb -load ~/.Xresources

# dbus
dbus-update-activation-environment --systemd DISPLAY

# audio
start-pulseaudio-x11

# toolbar
~/.config/polybar/launch.sh &
nm-applet &

# startup apps
alacritty -e tmux new-session -A -s main &

# wm
# exec ~/.xmonad/xmonad-x86_64-linux
exec bspwm 2>&1 > ~/.config/bspwm/logs
