ARG UBUNTU_VERSION="20.04"

FROM ubuntu:${UBUNTU_VERSION}

ENV TZ=Asia/Shanghai

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY . /root/deployEnv

RUN /root/deployEnv/setup_base.sh --home=/root --ubuntu-ver=${UBUNTU_VERSION}


RUN /root/deployEnv/setup_cargo.sh

RUN /root/deployEnv/setup_pip.sh

RUN /root/deployEnv/setup_npm.sh

RUN /root/deployEnv/setup_src.sh --home=/root --ubuntu-ver=${UBUNTU_VERSION}

RUN /root/deployEnv/setup_ssh.sh
