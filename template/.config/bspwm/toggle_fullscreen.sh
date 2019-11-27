#!/bin/sh

if [ $(bspc config top_padding) -eq 20 ]
then
    bspc config top_padding -8
    bspc config left_padding -8
    bspc config right_padding -8
    bspc config bottom_padding -8
    xdo hide -N Polybar
else
    bspc config top_padding 20
    bspc config left_padding 0
    bspc config right_padding 0
    bspc config bottom_padding 0
    xdo show -N Polybar
fi
