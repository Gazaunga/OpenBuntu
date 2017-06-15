alias apt5='sudo apt-get check && sudo apt-get update && sudo apt-get dist-upgrade && sudo apt-get autoremove --purge && sudo apt-get autoclean'

# some ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Get my IP address using HTTPS.
alias httpsip='curl -s https://4.ifcfg.me/'

#resolution for your system
alias res='xdpyinfo | grep resolution'

alias tmux='tmux -2' #Make tmux assume 256 colors.

alias shot="scrot ~/Screenshots/`date +%y-%m-%d-%H:%M:%S`.png"

alias make="clear && make"

alias fuck="sudo !!"

alias brc='emacs ~/.bashrc'

alias bsu='source ~/.bashrc'

alias q='exit'

alias cp='cp -r'

alias texupdate='tlmgr update --all'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias exe='sudo chmod +x'

# make `less` not clear the screen upon exit
alias less='less -X'

alias path='echo $PATH | tr -s ":" "\n"'

# fonts
alias fontc='fc-cache -fv'

alias exe='sudo chmod +x'


