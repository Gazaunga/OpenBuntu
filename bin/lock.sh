#!/usr/bin/env bash

icon="$HOME/Pictures/lock.png"
tmpbg='/tmp/screen.png'
tmpicon='/tmp/icon.png'

(( $# )) && { icon=$1; }

scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
convert "$icon" -scale 50% "$tmpicon"
convert "$tmpbg" "$tmpicon" -gravity center -composite -matte "$tmpbg"
i3lock -u -i "$tmpbg"

#i3lock?! make use something else?
