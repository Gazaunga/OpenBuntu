# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH

#source ~/.bashrc
source ~/.bash_aliases
source ~/.bash_functions

setxkbmap -option caps:swapescape
