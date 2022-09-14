#!/usr/bin/env bash

# 1. 全局变量
home=/home/haoming
codename=$(lsb_release -s -c)
arch=$(dpkg --print-architecture)
path_cfg_neovim=$home/.config/nvim
path_cfg_cheats=$home/.config/Cheats
path_cfg_snippets=$home/.config/Snippets

# 2. 安装额外源
sudo add-apt-repository -y -n ppa:neovim-ppa/unstable
sudo add-apt-repository -y -n ppa:git-core/ppa

sudo apt update && sudo apt install -y \
	neovim git zsh curl \
        tig tree silversearcher-ag htop ssh ctags

# 3. 应用配置
## 3.1 neovim
git clone --depth 1 https://github.com/wbthomason/packer.nvim $home/.local/share/nvim/site/pack/packer/start/packer.nvim
git clone https://github.com/HaomingJu/neovimCfg.git 	$path_cfg_neovim
git clone https://github.com/HaomingJu/Cheats.git 	$path_cfg_cheats
git clone https://github.com/HaomingJu/Snippets.git 	$path_cfg_snippets

## 3.2 oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

## 3.3 fzf
git clone --depth 1 https://github.com/junegunn/fzf.git $home/.fzf
$home/.fzf/install --completion --key-bindings --all

## 3.4 navi
bash <(curl -sL https://raw.githubusercontent.com/denisidoro/navi/master/scripts/install)

## 3.5 autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$home/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# 定时任务配置
