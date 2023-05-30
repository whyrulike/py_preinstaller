#!/bin/bash

# 包管理工具，针对不同的操作系统可能需要变更
if [ -f /etc/os-release ]; then
    # CentOS、RedHat、Fedora 等
    if [ "$(source /etc/os-release && echo $ID)" == "centos" ]; then
        PACKAGE_MANAGER="yum"
    # Ubuntu、Debian 等
    elif [ "$(source /etc/os-release && echo $ID)" == "ubuntu" ]; then
        PACKAGE_MANAGER="apt-get"
    fi
elif [ -f /etc/redhat-release ]; then
    # CentOS 6.x
    if [[ "$(cat /etc/redhat-release)" == "Red Hat Enterprise Linux"*" 6."* ]]; then
        PACKAGE_MANAGER="yum"
    fi
fi

if [ -z "$PACKAGE_MANAGER" ]; then
    echo "Unsupported operating system"
    exit 1
fi

# 安装 Python 3 和 pip3
sudo "$PACKAGE_MANAGER" update
sudo "$PACKAGE_MANAGER" install -y python3 python3-pip

# 安装 prometheus_client 库
pip3 install prometheus_client
