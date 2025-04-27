alias dps='docker ps'
alias dpa='docker ps -a'
alias dlogs='docker logs'
alias dc='docker compose'
alias dcud='docker compose up -d'
alias dcps='docker compose ps'
alias dcd='docker compose down'
alias ..='cd ..'
alias ...='cd .. & cd ..'

zinit ice pick"async.zsh" src"pure.zsh" # with zsh-async library that's bundled with it.
zinit light sindresorhus/pure

zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting

zinit snippet OMZP::command-not-found
