#!/bin/bash
cd ~/OpenBuntu
mv .bashrc ~/.bashrc
mv .bash_aliases ~/.bash_aliases
mv .bash_functions ~/.bash_functions
mv .screenrc ~/.screenrc
mv wallhaven-445512.jpg ~/Pictures/wallhaven-445512.jpg
mv .bash_profile ~/.bash_profile
mv .Xdefaults ~/.Xdefaults
mv .editorconfig ~/.editorconfig
mv .fehbg ~/.fehbg
mv .config ~/.config
mv rofi ~/rofi
mv .profile ~/.profile
mv .xinitrc ~/.xinitrc
mv .xmodmap ~/.xmodmap
mv bin ~/bin
source ~/bin/utils.sh
source ~/.bash_aliases
e_header "Building OpenBuntu"
cd ~/
e_underline "Loading Liquid Prompt"
git clone https://github.com/nojhan/liquidprompt.git
source liquidprompt/liquidprompt
sudo apt-get -y install openbox
sudo apt-get -y install xdg-user-dirs
xdg-user-dirs-update
e_success "We've got folders!"
e_underline "Now let's grab some PPAs"
sudo add-apt-repository ppa:rvm/smplayer
sudo add-apt-repository ppa:mc3man/mpv-tests
sudo add-apt-repository ppa:noobslab/apps
sudo add-apt-repository ppa:nilarimogard/webupd8
sudo apt-get -y --allow-unauthenticated update
sudo apt-get -y --allow-unauthenticated install gdm openbox lxappearance-obconf docky feh texlive-full nautilus compton rofi moc texstudio arandr leafpad fontforge lxappearance rxvt-unicode
cd ~/
e_underline "Spacemacs! Let's grab it!"
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
sudo apt-get -y install libreoffice darktable smplayer smtube smplayer-themes smplayer-skins mpv clipgrab openshot emacs python-pip albert
sudo pip install rainbowstream glances ImageScraper howdoi
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
sudo add-apt-repository 'deb https://typora.io ./linux/'
sudo apt-get -y --allow-unauthenticated update
sudo apt-get -qq update && sudo apt-get -qq dist-upgrade
# http://www.omgubuntu.co.uk/2016/02/word-clock-conky-config-linux
# https://www.box-look.org/p/1017851/
e_underline "Let's make sure Nautilus acts the way we want"
sudo chmod +x setup-nautilus.sh
./setup-nautilus.sh

hname="$(uname -n)"

e_bold "Setting graphical editor"
if which emacs; then
    printf 'Found Spacemacs\n'
    export EDITOR='emacs'
elif which subl; then
    printf 'Found Spacemacs\n'
    export EDITOR='emacs'
fi

e_bold "Loading default Xresources"
xrdb -merge "$HOME/conf/Xresources"
if [ -f "$HOME/.Xresources" ]; then
    printf 'Loading %s/.Xresources...\n' "$HOME"
    xrdb -merge "$HOME/.Xresources"
fi
if [ -f "$HOME/conf/hosts/$hname/Xresources" ]; then
    printf 'Loading Xresources for %s...\n' "$hname"
    xrdb -merge "$HOME/conf/hosts/$hname/Xresources"
fi

e_bold "Searching for xbindkeys"
if which xbindkeys; then
    printf 'Running xbindkeys...\n'
    xbindkeys
fi
e_error "Let's attempt obmenu-generator?!"
wget http://download.opensuse.org/repositories/home:Head_on_a_Stick:obmenu-generator/Debian_8.0/Release.key
sudo apt-key add - < Release.key
sudo apt-get -y update
sudo echo 'deb http://download.opensuse.org/repositories/home:/Head_on_a_Stick:/obmenu-generator/Debian_8.0/ /' > /etc/apt/sources.list.d/obmenu-generator.list 
sudo apt-get -y update
sudo apt-get -y install obmenu-generator
sudo obmenu-generator -i -p -c
reboot

