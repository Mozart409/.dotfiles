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
antigen theme half-life

# Tell Antigen that you're done.
antigen apply

# fnm
export PATH=/home/amadeus-debian/.fnm:$PATH
eval "$(fnm env)"

#deno 
export DENO_INSTALL="/home/amadeus-debian/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"


alias zs="micro ~/.zshrc"
alias sc="source ~/.zshrc"
alias vs="code ."


# Performance
# zmodload zsh/zprof
# zprof
