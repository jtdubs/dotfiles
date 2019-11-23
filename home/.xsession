# set colorscheme
xsetroot -bg black
xrdb -load ~/.Xresources

# dbus
dbus-update-activation-environment --systemd DISPLAY

# audio
start-pulseaudio-x11

# toolbar
polybar main &
nm-applet &

# startup apps
alacritty &

# wm
exec ~/.xmonad/xmonad-x86_64-linux
