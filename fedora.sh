#!/bin/sh

set -u
dnf update -y

# Install packages
dnf install wget curl zip git fira-code-fonts util-linux-user util-linux zsh tmux -y
dnf groupinstall "Development Tools" "Development Libraries"

# ZSH
curl -L https://raw.githubusercontent.com/Mozart409/.dotfiles/main/zsh/.zshrc.sample > ~/.zshrc
curl -L git.io/antigen > ~/antigen.zsh


# Arkade
curl -sLS https://get.arkade.dev | sudo sh

# Github Cli
dnf install 'dnf-command(config-manager)' -y 
sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo -y
dnf install gh -y

# fnm
curl -fsSL https://fnm.vercel.app/install | bash -s -- --install-dir "./.fnm" --skip-shell

# node
fnm install 18
fnm default 18
corepack enable

# change shell
chsh -s $(which zsh)
