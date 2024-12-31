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


${SUDO} apt update

${SUDO} apt install -y \
    gpg curl g++ gcc build-essential zsh wget \
    tig tree silversearcher-ag htop ssh unzip cargo \
    lsb-release npm rsync language-pack-zh-hans \
    software-properties-common net-tools universal-ctags \
    python3-pip openssh-server python3-pynvim python3-virtualenv \
    connect-proxy command-not-found

curl https://apt.kitware.com/keys/kitware-archive-latest.asc | ${SUDO} apt-key add -

echo "deb https://apt.kitware.com/ubuntu/ `lsb_release -c -s` main" | ${SUDO} tee /etc/apt/sources.list.d/kitware.list

${SUDO} add-apt-repository -y -n ppa:neovim-ppa/unstable
${SUDO} add-apt-repository -y -n ppa:git-core/ppa
${SUDO} apt update
${SUDO} apt install -y cmake git
${SUDO} apt upgrade -y

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --completion --key-bindings --all


pushd /opt
    wget https://github.com/clangd/clangd/releases/download/18.1.3/clangd-linux-18.1.3.zip
    unzip clangd-linux-18.1.3.zip
    rm clangd-linux-18.1.3.zip

    wget https://github.com/neovim/neovim/releases/download/v0.10.2/nvim-linux64.tar.gz
    tar -zxvf nvim-linux64.tar.gz
    rm nvim-linux64.tar.gz
popd
