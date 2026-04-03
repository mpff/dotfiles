export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="simple"

plugins=(git colored-man-pages zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Prepend hostname in yellow to make clear you're on a remote machine
PROMPT="%F{yellow}%m%f $PROMPT"

# Editor
export EDITOR='vim'

# History
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

# Completion
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

# Aliases
alias ll='ls -lah'
alias la='ls -A'
alias ..='cd ..'
alias ...='cd ../..'
alias tb="nc termbin.com 9999"
alias ssh="TERM=xterm ssh -t"
