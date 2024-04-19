#!/usr/bin/env bash

# 0. 解析参数
HOME=/home/haoming
PRIVILEGE=''
UBUNTU_VER="20.04"
for i in "$@"; do
    case $i in
        --home=*)
          HOME="${i#*=}"
          shift
          ;;
        --privilege)
          PRIVILEGE="sudo"
          shift # past argument=value
          ;;
        --ubuntu-ver=*)
          UBUNTU_VER="${i#*=}"
          shift # past argument=value
          ;;
        -*|--*)
          echo "Unknown option $i"
          exit 1
          ;;
        *)
          ;;
  esac
done
RED='\033[0;31m'

echo "${RED}HOME: ${HOME}"
echo "${RED}SUDO: ${SUDO}"
echo "${RED}UBUNTU_VER: ${UBUNTU_VER}" 

# 1. 全局变量
path_cfg_neovim=$HOME/.config/nvim
path_cfg_cheats=$HOME/.config/Cheats
path_cfg_snippets=$HOME/.config/Snippets


# 3. 下载开源代码
echo -e "${RED}下载开源代码"
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
git clone https://github.com/HaomingJu/neovimCfg.git 	$path_cfg_neovim
git clone https://github.com/HaomingJu/Snippets.git 	$path_cfg_snippets
git clone https://github.com/HaomingJu/Cheats.git 	$path_cfg_cheats
ln -s -f ${HOME}/deployEnv/conf/tigrc ${HOME}/.tigrc
ln -s -f ${HOME}/deployEnv/conf/zshrc ${HOME}/.zshrc
ln -s -f ${HOME}/deployEnv/conf/tigrc.theme ${HOME}/.tigrc.theme


#echo -e "${RED}nvim安装插件"
nvim -V --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
nvim -V --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

pushd ~/.config/coc/extensions
    cp ~/.config/nvim/helper/coc/package.json .
    npm install
popd
