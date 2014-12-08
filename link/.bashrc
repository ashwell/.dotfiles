# vi:syntax=sh
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ENVIRONMENT VARS
[[ `command -v less` ]] && PAGER=`command -v less`
[[ `command -v vim` ]] && EDITOR=`command -v vim` ; VISUAL=`command -v vim`

# CUSTOM PATH
PATH="/usr/local/bin:~/.dotfiles/bin:$PATH"

# CUSTOM CDPATH
[ -d ~/repos ] && CDPATH="$CDPATH:~/repos"
[ -d ~/repos/gh ] && CDPATH="$CDPATH:~/repos/gh"
[ -d ~/repos/bb ] && CDPATH="$CDPATH:~/repos/bb"
[ -d ~/repos/ed ] && CDPATH="$CDPATH:~/repos/ed"
[ -d ~/repos/mh ] && CDPATH="$CDPATH:~/repos/mh"
[ -d ~/workspace ] && CDPATH="$CDPATH:~/workspace"
[ -d ~/workspace/hound ] && CDPATH="$CDPATH:~/workspace/hound"

# INPUTRC
[ -f ~/.dotfiles/link/.inputrc ] && INPUTRC="~/.dotfiles/link/.inputrc"


# if bash 4 enable double star
[[ "$BASH_VERSION" == "4"* ]] && shopt -s globstar

# Source files, Should change to function, maybe change the folder structure a little too
[ -f ~/.dotfiles/source/.aliases ] && source ~/.dotfiles/source/.aliases
[ -f ~/.dotfiles/source/.bash_prompt ] && source ~/.dotfiles/source/.bash_prompt

# if has homebrew
if [[ `command -v brew` == *"brew" ]]; then
  [[ -f `brew --prefix`/etc/bash_completion ]] && source `brew --prefix`/etc/bash_completion
fi

[[ `command mono -v 2> /dev/null` ]] && export MONO_GAC_PREFIX="/usr/local"


export PATH CDPATH INPUTRC PAGER EDITOR VISUAL NPM_PACKAGES

