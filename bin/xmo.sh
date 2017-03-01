#!/bin/bash
cd ~/
touch ~/.xmobarrc
sudo aptitude install xmonad libghc-xmonad-contrib-dev xmobar stalonetray \
    suckless-tools scrot cabal-install xcompmgr
sudo cabal update
sudo cabal install --global yeganesh
cd ~/
mv .xmonad .xmonad.orig
git clone https://github.com/vicfryzel/xmonad-config.git .xmonad
