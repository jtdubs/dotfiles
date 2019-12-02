#!/bin/bash

iter=0
while [ $iter -lt 16 ]
do
    echo -en "\033[38;5;$(echo $iter)m█ "
    printf "%03d" $iter
    iter=$[$iter+1]
    printf '\r\n'
done
