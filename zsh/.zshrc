#!/bin/sh
source "${HOME}/antigen.zsh"

# Load the oh-my-zsh's library.
antigen use oh-my-zsh
# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle yarn
antigen bundle command-not-found
antigen bundle history-substring-search
antigen bundle aws
antigen bundle docker
antigen bundle sudo
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

# load after zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

# Load the theme.

# antigen theme denysdovhan/spaceship-prompt
#antigen theme half-life
antigen theme spaceship-prompt/spaceship-prompt

# Tell Antigen that you're done.
antigen apply

alias zs="micro ~/.zshrc"
alias sc="source ~/.zshrc"
alias vs="code ."
alias tr="trash"
alias ports="netstat -tulpn"
alias rustscan='docker run -it --rm --name rustscan rustscan/rustscan:1.10.0'


# fnm
export PATH=/home/amadeus/.fnm:$PATH
eval "$(fnm env)"

alias lzd="lazydocker"

# yarn global

export PATH="$PATH:$(yarn global bin)"

export PATH="$PATH:/home/amadeus/.local/bin"

# Added by Amplify CLI binary installer
export PATH="$HOME/.amplify/bin:$PATH"

export DENO_INSTALL="/home/amadeus/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Performance
# zmodload zsh/zprof
# zprof

export PATH=$PATH:/usr/local/go/bin


export PATH=/usr/bin:$PATH
export DOCKER_HOST=unix:///run/user/1000/docker.sock

# fnm
export PATH=/home/amadeus/.fnm:$PATH
eval "`fnm env`"

export PNPM_HOME="/home/amadeus/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

alias p='pnpm'

# Packages
alias pa='pnpm add'
alias pad='pnpm add --save-dev'
alias pap='pnpm add --save-peer'
alias prm='pnpm remove'
alias pin='pnpm install'
alias pun='pnpm uninstall'
alias pls='pnpm list'
alias pout='pnpm outdated'
alias pau='pnpm audit'
alias pwhy='pnpm why'
alias pui='pnpm update --interactive'
alias puil='pnpm update --interactive --latest'

# Global packages
alias pga='pnpm add --global'
alias pgls='pnpm list --global'
alias pgrm='pnpm remove --global'
alias pgu='pnpm update --global'

# Scripts
alias prun='pnpm run'
alias pd='pnpm run dev'
alias pb='pnpm run build'
alias ps='pnpm run serve'
alias pst='pnpm start'
alias pt='pnpm test'
alias ptc='pnpm test --coverage'
alias pln='pnpm run lint'
alias pdoc='pnpm run doc'

# Miscs
alias ph='pnpm help'
alias pi='pnpm init'
alias ppub='pnpm publish'
alias psv='pnpm server'

# pnpx
alias px='pnpm dlx'
