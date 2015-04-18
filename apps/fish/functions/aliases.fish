alias vi "vim"
alias c=clear
alias cl "clear;pwd;ll"
alias cla "clear;pwd;la"
alias ...="cd ../../"

if test (brew --prefix)
  alias brewu "brew update ;and brew doctor ;and echo outdated ; and brew outdated"
  alias brewcasku "brew cask update ;and brew cask doctor"
end

if test (uname -a | grep "Darwin*")
  alias editHosts "sudo vim /private/etc/hosts"
  alias flushDNS "dscacheutil -flushcache"
  alias renewip "flushDNS ;and sudo ipconfig set en0 BOOTP ;and sudo ipconfig set en0 DHCP"
  alias ostorm "open -a WebStorm"
end

# Git Short Commands (see .gitconfig for git aliases)
alias gfshow="git fetch origin ;and echo 'fetched origin' ;and git remote show origin"
alias cstat="clear ; pwd ; git status"
alias git-behind="git branch -vv --color=always | grep behind"
alias git-ahead="git branch -vv --color=always | grep ahead"
alias git-gone="git branch -vv --color=always | grep gone"
alias git-to-sync="git branch -vv --color=always | grep 'behind\|ahead\|gone'"

function -; cd -; end
function aliases; echo "aliases loaded"; end
