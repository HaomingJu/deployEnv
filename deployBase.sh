#!/usr/bin/env bash

GIT_NAME=juhaoming
GIT_NAME=juhaoming@outlook.com


# base deb
sudo apt install -y zsh git tig tree silversearcher-ag htop ssh ctags clang-format-8 python2.7-dev python2.7-dbg curl libssl-dev wget
sudo update-alternatives --install /usr/bin/clang-format clang-format `which clang-format-8` 100

# ssh-keygen
if [ -d"~/.ssh" ]; then
    rm ~/.ssh/* -rf
fi
ssh-keygen -f ~/.ssh/id_rsa -N ''

# git config
git config --global user.email ${GIT_EMAIL}
git config --global user.name ${GIT_NAME}

# navi
bash <(curl -sL https://raw.githubusercontent.com/denisidoro/navi/master/scripts/install)

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
