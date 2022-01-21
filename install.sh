#!/usr/bin/env bash

set -eEuo pipefail

#
# Nix w/ Home Manager install (manual)
#

# sh <(curl -L https://nixos.org/nix/install) --daemon
# sudo `which nix-daemon` &
# 
# echo 'export NIX_PATH=${NIX_PATH:+$NIX_PATH:}$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels' >> ~/.profile
# source ~/.profile
# 
# nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
# nix-channel --update
# nix-shell '<home-manager>' -A install

if uname -r | grep -qi wsl; then
  echo Detected OS: WSL
  ln -sf $PWD/home-wsl.nix home.nix
elif grep -qi ubuntu /etc/os-release; then
  echo Detected OS: Ubuntu
  ln -sf $PWD/home-ubuntu.nix home.nix
elif grep -qi nixos /etc/os-release; then
  echo Detected OS: NixOS
  ln -sf $PWD/home-nixos.nix home.nix
else
  echo Unsupported OS && false
fi

if [ -d ~/.config/nixpkgs ]; then
  rm -Rf ~/.config/nixpkgs
fi
ln -sf $PWD ~/.config/nixpkgs

home-manager switch

echo Installation complete.
