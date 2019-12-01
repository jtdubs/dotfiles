#!/bin/sh

# if current display is :0
if grep -q :0 ~/bin/source_display.sh
then
    # and if Xephyr is running
    if pgrep Xephyr
    then
        # then be willing to switch to display :1
        echo export DISPLAY=:1 > ~/bin/source_display.sh
    fi
# otherwise, if current is :1
else
    # switch to :0
    echo export DISPLAY=:0 > ~/bin/source_display.sh
fi
