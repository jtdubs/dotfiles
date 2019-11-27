#!/bin/bash

while read i
do
    NAME=$(echo $i | cut -d: -f1)
    RGB=$(echo $i | cut -d: -f2 | tr -d '" ')

    if [[ $NAME == base* ]]
    then
        find template -type f -exec perl -pi -e "s/#$RGB/##$NAME##/g" {} \;
    fi
done < theme.yml
