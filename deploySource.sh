#!/usr/bin/env bash

source /etc/lsb-release
source_root="https://mirrors.tuna.tsinghua.edu.cn/ubuntu/"
#source_root=http://192.168.1.95:8081/mirrors.tuna.tsinghua.edu.cn/ubuntu/
source_address_0="deb ${source_root} ${DISTRIB_CODENAME} main restricted universe multiverse"
source_address_1="deb ${source_root} ${DISTRIB_CODENAME}-updates main restricted universe multiverse"
source_address_2="deb ${source_root} ${DISTRIB_CODENAME}-backports main restricted universe multiverse"
source_address_3="deb ${source_root} ${DISTRIB_CODENAME}-security main restricted universe multiverse"

echo ${DISTRIB_DESCRIPTION}
sudo echo "${source_address_0}
${source_address_1}
${source_address_2}
${source_address_3}" > /etc/apt/sources.list

echo "Acquire::CompressionTypes::Order \"gz\";" >> /etc/apt/apt.conf.d/00aptitude

apt update
