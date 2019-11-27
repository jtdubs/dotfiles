#!/bin/bash

cp -r template tmp

while read i
do
    NAME=$(echo $i | cut -d: -f1)
    RGB=$(echo $i | cut -d: -f2 | tr -d '" ')

    if [[ $NAME == base* ]]
    then
        find tmp -type f -exec perl -pi -e "s/##$NAME##/#$RGB/ig" {} \;
    fi
done < theme.yml


TMP_FILES=$(find tmp/ -type f | sed 's/^tmp\///')

for F in $HOME_FILES
do
  if diff tmp/$F home/$F
  then
    echo Updating $F...
    cp -f tmp/$F home/$F
  fi
done

rm -Rf tmp
