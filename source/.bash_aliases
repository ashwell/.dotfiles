#
# ~/.bash_aliases
#

[[ `command vim --version` ]] && alias vi=vim

# Aliases
[[ "$OSTYPE" == "darwin"* ]] && alias ls='command ls -G'
# Needs a double check
[[ "$OSTYPE" == "arch"* ]] && alias ls='command ls --color=auto'
alias ll="ls -l"
alias llr="ls -lR"
alias la="ls -la"
alias lar="ls -laR"
alias cl="clear;pwd;ll"
alias cla="clear;pwd;la"

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias -- -='cd -'

# File size
alias fs="stat -f '%z bytes'"
alias df="df -h"

# OSX Suff
[[ "$OSTYPE" == "darwin"* ]] && alias editHosts='sudo vim /private/etc/hosts'
[[ "$OSTYPE" == "darwin"* ]] && alias flushDNS='dscacheutil -flushcache'

# Exit
alias c="clear"
#alias cls="c && !!"
alias lg="logout"

# Git Short Commands (see .gitconfig for git aliases)
alias gfshow="git fetch origin && echo 'fetched origin' && git remote show origin"
alias cstat="clear && git status"

# Homebrew
[[ `command brew -v` == "Homebrew"* ]] && alias brewu="brew update && brew doctor && echo 'outdated:\n' && brew outdated"

