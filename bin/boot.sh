#!/bin/bash
packagelist=packagelist

xargs -a <(awk '/^\s*[^#]/' "$packagelist") -r -- sudo apt-get -y install
