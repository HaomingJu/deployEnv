#!/usr/bin/env bash


#  判断是否存在
if [ -e /etc/ssh/sshd_config ]; then
    # 允许root用户登录
    sed -i 's/^#PermitRootLogin/PermitRootLogin/g' /etc/ssh/sshd_config
    sed -i 's/^PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config

    # 允许密码登录
    sed -i 's/^#PasswordAuthentication/PasswordAuthentication/g' /etc/ssh/sshd_config
    sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config

    # 重置ssh登录密码
    echo root:1 | chpasswd

    /etc/init.d/ssh restart

else
    echo "/etc/ssh/sshd_config not exist"
    exit -1
fi


