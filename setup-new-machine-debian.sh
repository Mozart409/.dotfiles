#!/usr/bin/env bash

if [ $(whoami) != root ]; then
    echo -e "Please run this script as root or using \e[31msudo"
    echo
    exit
fi


export DEBIAN_FRONTEND=noninteractive

echo "Updating sources"
apt update -y

echo "Installing new packages"
apt-get -q -y install fonts-firacode git zsh curl wget zip build-essential tmux net-tools neovim

mkdir -p ~/.config/nvim
curl -o ~/.config/nvim/init.vim -L https://raw.githubusercontent.com/Mozart409/.dotfiles/main/.config/nvim/init.vim

curl -o ~/.zshrc -L https://raw.githubusercontent.com/Mozart409/.dotfiles/main/zsh/.zshrc.sample
curl -L git.io/antigen > ~/antigen.zsh

# tmux
mkdir -p ~/.config/tmux
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
curl -o ~/.config/tmux/tmux.conf -L https://raw.githubusercontent.com/Mozart409/.dotfiles/main/.config/tmux/tmux.conf

zsh

chsh -s $(which zsh)


# echo "install aqua"
# curl -sSfL https://raw.githubusercontent.com/aquaproj/aqua-installer/v1.1.2/aqua-installer | bash

# echo "Download aqua config"
# curl -L https://raw.githubusercontent.com/Mozart409/.dotfiles/main/aqua.yaml >~/.config/aqua/aqua.yaml

# aqua install --all

# install tailscale
curl -fsSL https://tailscale.com/install.sh | sh

# download docker script
# curl -fsSL https://get.docker.com -o ~/get-docker.sh

# apt install -y debian-keyring debian-archive-keyring apt-transport-https
# curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
# curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | tee /etc/apt/sources.list.d/caddy-stable.list
# apt update
# apt install caddy


