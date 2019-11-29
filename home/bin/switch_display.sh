#!/bin/sh

# if current display is :0
if grep -q :0 ~/bin/exec_display.sh
then
    # and if Xephyr is running
    if pgrep Xephyr
    then
        # then be willing to switch to display :1
        cp -f ~/bin/exec_display_1.sh ~/bin/exec_display.sh
    fi
# otherwise, if current is :1
else
    # switch to :0
    cp -f ~/bin/exec_display_0.sh ~/bin/exec_display.sh
fi
