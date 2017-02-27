#!/bin/bash
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
packagelist=packagelist
xargs -a <(awk '/^\s*[^#]/' "$packagelist") -r -- sudo apt-get -y install
