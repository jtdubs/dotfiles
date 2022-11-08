#!/usr/bin/env bash

set -eEuo pipefail

LINKS=(
    ".bash_aliases"
    ".bash_login"
    ".bashrc"
    ".config/alacritty"
    ".config/nvim"
    ".config/starship.toml"
    ".gitconfig"
    ".profile"
    ".ssh/environment"
    ".tmux.conf"
    ".tmux.conf.local"
    ".zshrc"
    ".zshtheme"
)

echo "Creating symlinks..."
for l in ${LINKS[@]}; do
    ln -sf $PWD/home/$l $HOME/$l
done
echo "Done."
