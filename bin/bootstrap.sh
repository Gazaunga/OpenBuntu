cd ~/
git clone https://github.com/nojhan/liquidprompt.git
source liquidprompt/liquidprompt
sudo apt-get -y install openbox
sudo apt-get -y install xdg-user-dirs
xdg-user-dirs-update
sudo add-apt-repository ppa:rvm/smplayer
sudo add-apt-repository ppa:mc3man/mpv-tests
sudo add-apt-repository ppa:noobslab/apps
sudo add-apt-repository ppa:nilarimogard/webupd8
sudo apt-get -y --allow-unauthenticated update
sudo apt-get -y --allow-unauthenticated install gdm texlive-full nautilus compton rofi moc texstudio arandr leafpad fontforge lxappearance rxvt-unicode-256color
cd ~/
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
sudo apt-get -y install libreoffice darktable smplayer smtube smplayer-themes smplayer-skins mpv clipgrab openshot covergloobus emacs python-pip albert
sudo pip install rainbowstream glances ImageScraper howdoi
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
sudo add-apt-repository 'deb https://typora.io ./linux/'
sudo apt-get -y --allow-unauthenticated update
sudo apt-get -qq update && sudo apt-get -qq dist-upgrade
# http://www.omgubuntu.co.uk/2016/02/word-clock-conky-config-linux
# https://www.box-look.org/p/1017851/
