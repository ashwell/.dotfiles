# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

# Git Auto Complete
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

# Short Commands
alias la="ls -la"
alias c="clear"
alias lg="logout"

# Grep Exclude mins
alias grepNoMin='grep -rsl --exclude="*\.min\."'

# Build Stuff
alias balls-build="~/alpha-web/wp-content/themes/score/build"
alias bb="balls-build all"
alias bbl="balls-build less"
alias bbj="balls-build js"
alias bbb="balls-build balls"
alias bbm="balls-build more"

# Navigation Commands
alias web="cd ~/alpha-web/"
alias mfp="cd ~/alpha-mfp/"
alias score="cd ~/alpha-web/wp-content/themes/score/"

# Git Shortcuts
alias chkmfp="cd ~/alpha-mfp/ && git status"
alias git-log-graph="git log --all --graph --decorate --oneline --simplify-by-decoration"
alias showBranches="git show-branch --all"

# Diff
alias webDiff="web && git diff > ~/web.diff && vi ~/web.diff"
