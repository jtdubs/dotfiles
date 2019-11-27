#!/bin/bash

for PID in $(pgrep launch-polybar)
do
    if [ $PID -ne $$ ]
    then
        kill $PID
    fi
done

killall -q polybar

while true
do
    polybar -reload main 2>&1 > ~/.config/polybar/logs
    sleep 1
done
