#!/bin/bash

set -e

FILES=$(find files/ -type f | sed 's/^files\///')
UPDATES=

for F in $FILES
do
  if [ files/$F -nt ~/$F ]
  then
    echo Updating $F...
    cp -pf files/$F ~/$F
    UPDATES=$UPDATES:$F
  elif [ ~/$F -nt files/$F ]
  then
    echo Pulling in newer $F...
    cp -pf ~/$F files/$F
  fi
done

if [[ $UPDATES =~ xmonad ]]
then
  echo Restarting xmonad...
  xmonad --recompile > /dev/null 2>&1
  xmonad --restart   > /dev/null 2>&1
fi

if [[ $UPDATES =~ polybar ]]
then
  echo Restarting polybar...

  # kill polybar
  killall -q polybar || true
  while pgrep -u $UID -x polybar > /dev/null
  do
    sleep 1
  done

  # start polybar
  polybar main > /dev/null 2>&1 &
fi

if [[ $UPDATES =~ nvim ]]
then
  echo Updating NVim...
  nvim --headless +PlugInstall +PlugUpdate +qa
fi

