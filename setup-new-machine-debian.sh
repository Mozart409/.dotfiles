#!/usr/bin/env bash

if [ "$(whoami)" != root ]; then
    echo -e "Please run this script as root or using \e[31msudo"
    echo
    exit
fi


export DEBIAN_FRONTEND=noninteractive

echo "Updating sources"
apt update -y

apt install -y nala

nala install -y --update wget gpg

# Add MPR Repo
wget -qO - 'https://proget.makedeb.org/debian-feeds/prebuilt-mpr.pub' | gpg --dearmor | sudo tee /usr/share/keyrings/prebuilt-mpr-archive-keyring.gpg 1> /dev/null

echo "deb [arch=all,$(dpkg --print-architecture) signed-by=/usr/share/keyrings/prebuilt-mpr-archive-keyring.gpg] https://proget.makedeb.org prebuilt-mpr $(lsb_release -cs)" | sudo tee /etc/apt/sources.list.d/prebuilt-mpr.list


echo "Installing new packages"
nala install -y --update fonts-firacode git zsh curl wget zip build-essential tmux net-tools neovim just ripgrep


echo "cloning .dotfiles in home / ~ dir"
git clone https://github.com/Mozart409/.dotfiles.git "$HOME"

if [ ! -d "$HOME/.config" ]; then
  echo "creating ~/.config folder"
  mkdir "$HOME/.config"
fi

NVIM_DIRECTORY="$HOME/.config/nvim"
TMUX_DIRECTORY="$HOME/.config/tmux"

if [ -d "$NVIM_DIRECTORY" ]; then
  echo "$NVIM_DIRECTORY does exist. Aborting"

else
 echo "$NVIM_DIRECTORY does _NOT_ exist. symlinking config"
 ln -s "$HOME"/.dotfiles/.config/nvim "$HOME"/.config/nvim
fi

if [ -d "$TMUX_DIRECTORY" ]; then
  echo "$TMUX_DIRECTORY does exist. Aborting"

else
 echo "$TMUX_DIRECTORY does _NOT_ exist. symlinking config"
 echo "Cloning tpm"
 git clone https://github.com/tmux-plugins/tpm "$HOME/.dotfiles/.config/tmux/plugins/tpm"
 ln -s "$HOME"/.dotfiles/.config/tmux "$HOME"/.config/tmux
fi


curl -o "$HOME"/.zshrc -L https://raw.githubusercontent.com/Mozart409/.dotfiles/main/zsh/.zshrc.sample
curl -L git.io/antigen > "$HOME"/antigen.zsh

chsh -s "$(which zsh)"

zsh

# install tailscale
curl -fsSL https://tailscale.com/install.sh | sh
