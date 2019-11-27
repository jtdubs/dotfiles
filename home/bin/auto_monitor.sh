#!/bin/bash

if [ x"$(autorandr --detected)" == x"$(autorandr --current)" ]
then
    echo Monitor setup already correct.
    exit 0
else
    echo Auto-detecting monitor setup...
    autorandr -c
    sleep 2
fi
