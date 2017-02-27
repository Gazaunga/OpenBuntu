#!/bin/bash
cd ~/
git clone https://github.com/nojhan/liquidprompt.git
source liquidprompt/liquidprompt
sudo apt-get -y install openbox obconf
echo 'deb http://download.opensuse.org/repositories/home:/Head_on_a_Stick:/obmenu-generator/Debian_8.0/ /' > /etc/apt/sources.list.d/obmenu-generator.list
sudo apt-get -y --allow-unauthenticated update
sudo apt-get -y install xdg-user-dirs obmenu-generator
xdg-user-dirs-update
obmenu-generator -i -p -c
sudo add-apt-repository ppa:rvm/smplayer
sudo add-apt-repository ppa:mc3man/mpv-tests
sudo add-apt-repository ppa:noobslab/apps
sudo add-apt-repository ppa:nilarimogard/webupd8
sudo apt-get -y --allow-unauthenticated update
cd ~/
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
packagelist=packagelist
xargs -a <(awk '/^\s*[^#]/' "$packagelist") -r -- sudo apt-get -y install
sudo pip install rainbowstream glances ImageScraper howdoi
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
sudo add-apt-repository 'deb https://typora.io ./linux/'
sudo apt-get -y --allow-unauthenticated update
