#!/usr/bin/env bash


#Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt-add-repository 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main'
sudo apt update
sudo apt install -y google-chrome-stable

#CMake
wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | sudo apt-key add -
sudo apt-add-repository 'deb https://apt.kitware.com/ubuntu/ xenial main'
sudo apt update
sudo apt install -y cmake

#Sougou InputMethod
sudo apt remove fcitx-ui-qimpanel
curl -o sogoupinyin_2.4.0.3469_amd64.deb \
    -L https://ime.sogouimecdn.com/202108021651/7bf376ea0f8062be36c2012bbf9439dd/dl/index/1612260778/sogoupinyin_2.4.0.3469_amd64.deb
sudo dpkg -i sogoupinyin_2.4.0.3469_amd64.deb
sudo apt install -f

#Git-LFS
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt install git-lfs

#ssr
curl -o electron-ssr-0.2.7.deb \
    -L 
sudo dpkg -i electron-ssr-0.2.7.deb
sudo apt install  -f
