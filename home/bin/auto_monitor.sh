#!/bin/bash

for i in 1 2 3 4 5
do
    if [ x"$(autorandr --detected)" == x"$(autorandr --current)" ]
    then
        echo Monitor setup already correct.
        exit 0
    else
        echo Auto-detecting monitor setup...
        autorandr -c
        sleep 2
    fi
done
