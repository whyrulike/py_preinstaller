#!/bin/bash
# install python env
sudo apt update
sudo apt install python3-pip -y
pip3 install prometheus_client
pip3 install psutil
pip3 install loguru

# install dependent
sudo apt update && sudo apt install snapd -y && sudo apt-get install git -y && sudo apt-get install gcc -y  && sudo apt-get install make -y
sudo snap install lz4
sudo apt install net-tools -y
sudo apt-get install iftop -y

# install go
sudo rm -rvf /usr/local/go/
wget https://golang.org/dl/go1.21.1.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.21.1.linux-amd64.tar.gz
rm go1.21.1.linux-amd64.tar.gz

tee -a ~/.profile > /dev/null << EOF
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export GO111MODULE=on
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin
EOF

source ~/.profile

# check work dir
rockx_dir="/opt/rockx"
# 检查目录是否存在
if [ -d "$rockx_dir" ]; then
    echo "The directory $rockx_dir already exists. Skipping..."
else
    # 如果目录不存在，则创建并设置权限
    sudo mkdir -p "$rockx_dir" && sudo chown -R ubuntu:ubuntu "$rockx_dir"
    echo "The directory $rockx_dir was created and permissions were set."
fi

