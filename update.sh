#!/bin/sh

set -e

# Basic dot-files
for F in .xsession .Xresources .gitconfig .dmrc .bashrc .bash_aliases
do
  if [ $F -nt ~/$F ]
  then
    echo Updating $F...
    cp -pf $F ~/$F
  fi
done

# xmonad
if [ .xmonad/xmonad.hs -nt ~/.xmonad/xmonad.hs ]
then
  echo Updating xmonad...
  cp -pf .xmonad/xmonad.hs ~/.xmonad
  xmonad --recompile && xmonad --restart
fi

# alacritty
if [ .config/alacritty/alacritty.yml -nt ~/.config/alacritty/alacritty.yml ]
then
  echo Updating alacritty...
  cp -pf .config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
fi

# polybar
if [ .config/polybar/config -nt ~/.config/polybar/config ]
then
  echo Updating polybar...
  cp -pf .config/polybar/config ~/.config/polybar/config 

  # kill polybar
  killall -q polybar || true
  while pgrep -u $UID -x polybar > /dev/null
  do
    sleep 1
  done

  # start polybar
  polybar main > /dev/null 2>&1 &
fi

# nvim
UPDATE_VIM=0
for F in .config/nvim/init.vim .config/nvim/autoload/plug.vim .config/nvim/plugged/lightline.vim/autoload/lightline/colorscheme/seti.vim
do
  if [ $F -nt ~/$F ]
  then
    if [ $UPDATE_VIM -eq 0 ]
    then
      echo Updating NVim...
      UPDATE_VIM=1
    fi
    cp -pf $F ~/$F
  fi
done
if [ $UPDATE_VIM -eq 1 ]
then
  nvim --headless +PlugInstall +PlugUpdate +qa
fi
