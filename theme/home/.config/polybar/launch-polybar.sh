#!/bin/sh

killall -q launch-polybar.sh
killall -q polybar

while true
do
    polybar -reload main
    sleep 1
done
