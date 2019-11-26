#!/bin/bash

set -e

HOME_FILES=$(find home/ -type f | sed 's/^home\///')
UPDATES=

for F in $HOME_FILES
do
  if [ home/$F -nt ~/$F ]
  then
    echo Updating $F...
    cp -pf home/$F ~/$F
    UPDATES=$UPDATES:$F
  elif [ ~/$F -nt home/$F ]
  then
    echo Pulling in newer $F...
    cp -pf ~/$F home/$F
  fi
done

if [[ $UPDATES =~ nvim ]]
then
  echo Updating NVim...
  nvim --headless +PlugInstall +PlugUpdate +qa
fi

