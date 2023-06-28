#!/usr/bin/env bash

if [ $(whoami) != root ]; then
    echo -e "Please run this script as root or using \e[31msudo"
    echo
    exit
fi

do_space() {
    echo -e "\n \n"
}

export DEBIAN_FRONTEND=noninteractive
do_space
echo "Updating sources"
apt update -y
do_space
echo "Installing new packages"
apt-get -q -y install fonts-firacode git zsh curl wget zip build-essential vim neovim

curl -L https://raw.githubusercontent.com/Mozart409/.dotfiles/main/zsh/.zshrc.sample >~/.zshrc
curl -L git.io/antigen >~/antigen.zsh
zsh

# echo "install aqua"
# curl -sSfL https://raw.githubusercontent.com/aquaproj/aqua-installer/v1.1.2/aqua-installer | bash

# echo "Download aqua config"
# curl -L https://raw.githubusercontent.com/Mozart409/.dotfiles/main/aqua.yaml >~/.config/aqua/aqua.yaml

# aqua install --all

# install tailscale
curl -fsSL https://tailscale.com/install.sh | sh

# download docker script
curl -fsSL https://get.docker.com -o ~/get-docker.sh

chsh -s $(which zsh)
