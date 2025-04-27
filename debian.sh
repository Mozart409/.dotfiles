#!/bin/sh

set -eox

set pipefail

export DEBIAN_FRONTEND=noninteractive
echo "Setting up new debian machine"

# Update the package list
apt-get update -y

# Install the required packages
apt-get install -y nala

# Install the required packages
nala install -y build-essential wget curl git zip unzip vim net-tools iputils-ping dnsutils netcat-traditional gpg passwd fonts-firacode pkg-config libssl-dev tmux ripgrep sed unzip jq tree btop zsh

# Create empty .zshrc file
touch ~/.zshrc

# Installing zinit
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

# Append to zshrc
wget https://raw.githubusercontent.com/mozart409/.dotfiles/main/zshrc >>~/.zshrc

# Change the shell to zsh
usermod -s /usr/bin/zsh $USER

exit 0
