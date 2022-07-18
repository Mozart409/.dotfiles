#!/bin/sh

set -u
dnf update -y

# Install packages
dnf install wget curl zip jq git fira-code-fonts -y

# ZSH
curl -L https://raw.githubusercontent.com/Mozart409/.dotfiles/main/zsh/.zshrc.sample > ~/.zshrc
curl -L git.io/antigen > ~/antigen.zsh
chsh -s $(which zsh)