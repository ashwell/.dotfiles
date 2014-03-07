# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin:$HOME/node_modules/.bin

HISTFILESIZE=42000000000
HISTSIZE=42000000

export PATH HISTFILESIZE HISTSIZE 
unset USERNAME

echo "#### `uname -a`"
echo "#### instance-stats:`uptime`"
echo "####"
echo "#### Welcome to `hostname`, `whoami`!"
echo "#### `date`"
echo "####"

# Dry Run Fetch repos then show origin
echo "*** Stats for alpha-mfp ***"
cd ~/alpha-mfp/
echo "Fetch Dry Run:"
git fetch --dry-run
#echo "Show Origin"
#git remote show origin
echo "*** Stats for alpha-web ***"
cd ~/alpha-web/
echo "Fetch Dry Run:"
git fetch --dry-run
echo "Show Origin"
git remote show origin

cd ~
