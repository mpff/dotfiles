# Prompt with git branch
git_branch() {
    git branch 2>/dev/null | grep '^*' | colrm 1 2
}
PS1='\[\e[0;32m\]\u@\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0;33m\]$(b=$(git_branch); [ -n "$b" ] && echo " ($b)")\[\e[0m\]\$ '

# Editor
export EDITOR='vim'

# History
HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoreboth
shopt -s histappend
shopt -s checkwinsize

# Aliases
alias ll='ls -lah'
alias la='ls -A'
alias ..='cd ..'
alias ...='cd ../..'
alias tb="nc termbin.com 9999"
alias ssh="TERM=xterm ssh -t"

# Enable colors
if [ -x /usr/bin/dircolors ]; then
    eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi
