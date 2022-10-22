#!/bin/sh

set -u
dnf update -y

echo "Installing packages"
# Install packages
dnf install wget curl zip git fira-code-fonts util-linux-user util-linux zsh tmux -y
dnf groupinstall "Development Tools" "Development Libraries" -y

echo "zsh config"
# ZSH
curl -L https://raw.githubusercontent.com/Mozart409/.dotfiles/main/zsh/.zshrc.sample > ~/.zshrc
curl -L git.io/antigen > ~/antigen.zsh

echo "arkade"
# Arkade
curl -sLS https://get.arkade.dev | sudo sh

echo "github cli"
# Github Cli
dnf install 'dnf-command(config-manager)' -y 
sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo -y
dnf install gh -y

echo "fnm"
# fnm
curl -fsSL https://fnm.vercel.app/install | bash -s -- --install-dir "./.fnm" --skip-shell


echo "dprint"
curl -fsSL https://dprint.dev/install.sh | sh

echo "node"
# node
# fnm install 18
# fnm default 18
# corepack enable

# change shell
chsh -s $(which zsh)
