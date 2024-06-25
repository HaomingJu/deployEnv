#!/usr/bin/env bash


#  判断是否存在
if [ -e /etc/ssh/sshd_config ]; then
    #sed -i 's/^#PermitRootLogin.*$/PermitRootLogin yes/g' /etc/ssh/sshd_config
    #sed -i 's/^#PasswordAuthentication.*$/PasswordAuthentication yes/g' /etc/ssh/sshd_config
    
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
    echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
    echo root:1 | chpasswd
else
    echo "/etc/ssh/sshd_config not exist"
    exit -1
fi


