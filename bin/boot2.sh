#!/bin/bash
touch .xsession
cd ~/
git clone https://github.com/nojhan/liquidprompt.git
source liquidprompt/liquidprompt
sudo apt-get -y install xdg-user-dirs
xdg-user-dirs-update
cd ~/OpenBuntu/bin
mv .bashrc ~/.bashrc
mv .bash_aliases ~/.bash_aliases
mv .bash_functions ~/.bash_functions
mv .screenrc ~/.screenrc
mv wallhaven-445512.jpg ~/Pictures/wallhaven-445512.jpg
mv .bash_profile ~/.bash_profile
cd ~/
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
sudo aptitude install gdm xmonad texstudio libghc-xmonad-contrib-dev fontforge lxappearance rxvt-unicode-256color nautilus texlive-full xmobar emacs krita stalonetray \
    suckless-tools scrot cabal-install xcompmgr
sudo cabal update
sudo cabal install --global yeganesh
cd ~/
mv .xmonad .xmonad.orig
git clone https://github.com/vicfryzel/xmonad-config.git .xmonad
xmonad --recompile
sudo dpkg-reconfigure gdm
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
sudo add-apt-repository 'deb https://typora.io ./linux/'
sudo apt-get -y --allow-unauthenticated update
sudo apt-get -qq update && sudo apt-get -qq dist-upgrade
cd ~/OpenBuntu/.config
mv cava ~/.config/cava
mv compton.conf ~/.config/compton.conf
mv openbox ~/.config/openbox
echo "Your Xmo Box is ready!"
