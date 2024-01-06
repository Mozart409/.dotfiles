#!/usr/bin/env bash

if [ "$(whoami)" != root ]; then
    echo -e "Please run this script as root or using \e[31msudo"
    echo
    exit
fi


export DEBIAN_FRONTEND=noninteractive

echo "Updating sources"
apt update -y

apt install nala

echo "Installing new packages"
nala install -y --update fonts-firacode git zsh curl wget zip build-essential tmux net-tools neovim ripgrep


echo cloning .dotfiles in home / ~ dir
cd "$HOME" || exit 1
git clone https://github.com/Mozart409/.dotfiles.git

NVIM_DIRECTORY="$HOME/.config/nvim"
TMUX_DIRECTORY="$HOME/.config/tmux"

if [ -d "$NVIM_DIRECTORY" ]; then
  echo "$NVIM_DIRECTORY does exist. Aborting"

else
 echo "$NVIM_DIRECTORY does _NOT_ exist. symlinking config"
 ln -s "$HOME"/.dotfiles/nvim "$HOME"/.config/nvim
fi

if [ -d "$TMUX_DIRECTORY" ]; then
  echo "$TMUX_DIRECTORY does exist. Aborting"

else
 echo "$TMUX_DIRECTORY does _NOT_ exist. symlinking config"
 ln -s "$HOME"/.dotfiles/tmux "$HOME"/.config/tmux

 echo "Cloning tpm"
 git clone https://github.com/tmux-plugins/tpm "$HOME"/.config/tmux/plugins/tpm

fi


curl -o "$HOME"/.zshrc -L https://raw.githubusercontent.com/Mozart409/.dotfiles/main/zsh/.zshrc.sample
curl -L git.io/antigen > "$HOME"/antigen.zsh

chsh -s "$(which zsh)"

zsh

# install tailscale
curl -fsSL https://tailscale.com/install.sh | sh
