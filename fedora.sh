#!/bin/sh
# check if sudo
if [ "$USER" != "root" ]
then
    echo "Please run this as root or with sudo"
    exit 2
fi

set -u 
dnf update -y

echo "Installing packages"
# Install packages
dnf install wget curl zip git fira-code-fonts util-linux-user util-linux zsh tmux -y
dnf install google-cousine-fonts -y
dnf groupinstall "Development Tools" "Development Libraries" -y
dnf install 'dnf-command(config-manager)' -y

echo "zsh config"
# ZSH
curl -L https://raw.githubusercontent.com/Mozart409/.dotfiles/main/zsh/.zshrc.sample >~/.zshrc
curl -L git.io/antigen >~/antigen.zsh

echo "install aqua"
curl -sSfL https://raw.githubusercontent.com/aquaproj/aqua-installer/v1.1.2/aqua-installer | bash

echo "Download aqua config"
curl -L https://raw.githubusercontent.com/Mozart409/.dotfiles/main/aqua.yaml >~/.config/aqua/aqua.yaml

aqua install --all

echo "node"
# node
# fnm install 18
# fnm default 18
# corepack enable

# change shell
chsh -s $(which zsh)

# instell helix editor
dnf copr enable varlad/helix
dnf install helix -y

# install github cli
dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo -y
dnf install gh -y