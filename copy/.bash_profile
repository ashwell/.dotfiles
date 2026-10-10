#
# ~/.bash_profile
#

[[ -f ~/.dotfiles/.bashrc ]] && . ~/.dotfiles/.bashrc

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm use default || true

function maybeDoNvmUse() {
  [[ -f ./.nvmrc ]] && nvm use || true
}

function cd() {
  builtin cd "$@" && maybeDoNvmUse
}

