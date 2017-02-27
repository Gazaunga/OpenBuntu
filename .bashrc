# Use the system config if it exists
if [ -f /etc/bashrc ]; then
    . /etc/bashrc        # --> Read /etc/bashrc, if present.
elif [ -f /etc/bash.bashrc ]; then
    . /etc/bash.bashrc   # --> Read /etc/bash.bashrc, if present.
fi

# The following lines are only for interactive shells
[[ $- = *i* ]] || return

# Use Bash completion, if installed
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Use Liquid Prompt (but not in interactive shells)
[[ $- = *i* ]] && source ~/liquidprompt/liquidprompt

source ~/.bash_aliases
source ~/.bash_functions
