PATH=$PATH
export PATH

# Bash Stuffs
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

# Git Auto-Complete & Prompt
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
  # Source Git Comand Prompt script and set Prompt
  if [ -f ~/.git-prompt.sh ]; then
    . ~/.git-prompt.sh
    # Set Prompt
    GIT_PS1_SHOWUPSTREAM="auto verbose legacy"
    GIT_PS1_SHOWDIRTYSTATE=true
    GIT_PS1_SHOWSTASHSTATE=true
    GIT_PS1_SHOWUNTRACKEDFILES=true
    GIT_PS1_DESCRIBE_STYLE="branch"
    PS1='[\[$(tput setaf 3)\]\u@\h \[$(tput setaf 7)\]\W\[$(tput setaf 6)\]$(__git_ps1 " {%s}")\[$(tput sgr0)\]]\$ '
    export PS1
  fi
fi

# NPM Auto Complete
if [ -f ~/.npm-completion.sh ]; then
  . ~/.npm-completion.sh
fi

# Short Comands
alias la="ls -al"
alias ll="ls -l"
alias c=clear
alias apps="cd ~/Applications"
alias brewu="brew update && brew upgrade && brew doctor"

# Git Shorts
alias gfshow="git fetch origin && echo 'fetched origin' && git remote show origin"
alias cstat="clear && git status"

### Project Shortcuts

