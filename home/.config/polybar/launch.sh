#!/bin/sh

if ! pgrep polybar
then
    while true
    do
        polybar -reload main
        sleep 1
    done
fi
