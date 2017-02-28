#!/bin/bash

hname="$(uname -n)"

printf 'Setting graphical editor...\n'
if which emacs; then
    printf 'Found Spacemacs\n'
    export EDITOR='emacs'
elif which subl; then
    printf 'Found Spacemacs\n'
    export EDITOR='emacs'
fi

printf 'Loading default Xresources...\n'
xrdb -merge "$HOME/conf/Xresources"
if [ -f "$HOME/.Xresources" ]; then
    printf 'Loading %s/.Xresources...\n' "$HOME"
    xrdb -merge "$HOME/.Xresources"
fi
if [ -f "$HOME/conf/hosts/$hname/Xresources" ]; then
    printf 'Loading Xresources for %s...\n' "$hname"
    xrdb -merge "$HOME/conf/hosts/$hname/Xresources"
fi

# Bars
printf 'Searching for i3status...\n'
if which i3status; then
    printf 'Searching for xmobar...\n'
    if which xmobar; then
        printf 'Running i3status and xmobar...\n'
        i3status | xmobar &
    fi
fi

printf 'Searching for xbindkeys...\n'
if which xbindkeys; then
    printf 'Running xbindkeys...\n'
    xbindkeys
fi

printf 'Searching for xautolock...\n'
if which xautolock; then
    printf 'Searching for i3lock...\n'
    if which i3lock; then
        printf 'Running xautolock with i3lock...\n'
        xautolock -time 10 -locker "i3lock -fc000000" -detectsleep &
        printf 'Searching for caffeine...\n'
        if which caffeine; then
            printf 'Running caffeine...\n'
            caffeine &
        fi
    fi
fi

#dbus
printf 'Searching for dbus...\n'
if [ -f '/etc/X11/xinit/xinitrc.d/30-dbus.sh' ]; then
    . '/etc/X11/xinit/xinitrc.d/30-dbus.sh'
fi

# These lines race on some systems. No idea why.
xsetroot -cursor_name left_ptr
# TODO figure out how to combine this with the below: setxkbmap -option ctrl:nocaps
if [ -f "$HOME/conf/hosts/$hname/xkb" ]; then
    printf 'Loading XKB keymap for %s on display %s...\n' "$hname" "$DISPLAY"
    xkbcomp -I"$HOME/conf/hosts/$hname/xkb" "$HOME/conf/hosts/$hname/xkb/pc.xkb" "$DISPLAY"
else
    printf 'Loading standard XKB keymap on display %s...\n' "$DISPLAY"
    xkbcomp -I"$HOME/conf/xkb" "$HOME/conf/xkb/pc.xkb" "$DISPLAY"
fi
xrandr --dpi 96

if which xcape; then
    printf 'Launching xcape...\n'
    xcape
fi

if which redshift; then
    printf 'Launching redshift...\n'
    redshift &
    redpid=$!
fi

[ -z ${redpid+x} ] || kill "$redpid"
