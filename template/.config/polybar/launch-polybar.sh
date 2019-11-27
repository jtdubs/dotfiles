#!/bin/bash

pgrep launch-polybar | xargs -n1 kill
killall -q polybar

while true
do
    polybar -reload main 2>&1 > ~/.config/polybar/logs
    sleep 1
done
