#!/usr/bin/env bash

set -eEuo pipefail

PACKAGES=(
    build-essential
    code
    curl
    git
    gnome-tweaks
    google-chrome-stable
    neovim
    python3
    python3-pip
    python3-venv
    tmux
    zsh
)

LINKS=(
    ".bash_aliases"
    ".bash_login"
    ".bashrc"
    ".config/alacritty"
    ".config/nvim"
    ".config/starship.toml"
    ".config/sway"
    ".config/swaylock"
    ".config/systemd/user/gdrive.service"
    ".config/tofi"
    ".config/waybar"
    ".gitconfig"
    ".local/share/nvim/plugged/lightline.vim/autoload/lightline/colorscheme/base16auto.vim"
    ".profile"
    ".ssh/environment"
    ".tmux.conf"
    ".tmux.conf.local"
    ".zshrc"
    ".zshtheme"
)

echo "Installing packages..."
export DEBIAN_FRONTEND=noninteractive
sudo apt-get -qq update
for p in ${PACKAGES[@]}; do
    # Check if package is already installed
    if [ $(apt list -qq --installed $p 2>/dev/null | wc -l) -ne 1 ]; then
        sudo apt-get install -y $p
    fi
done
echo "Done."

if command -v go >/dev/null; then
    echo "Install golang tools..."
    if [ ! -e ~/go/bin/gopls ]; then
        go install golang.org/x/tools/gopls@latest
    fi
    if [ ! -e ~/go/bin/dlv ]; then
        go install github.com/go-delve/delve/cmd/dlv@latest
    fi
    if [ ! -e ~/go/bin/staticcheck ]; then
        go install honnef.co/go/tools/cmd/staticcheck@latest
    fi
    if [ ! -e ~/go/bin/rclone ]; then
        go install github.com/rclone/rclone@latest
    fi
    echo "Done."
fi

echo "Creating symlinks..."
for l in ${LINKS[@]}; do
    if ! readlink $HOME/$l > /dev/null; then
        ln -sf $PWD/home/$l $HOME/$l
    fi
done
echo "Done."
