#!/bin/bash

sudo apt update
sudo apt install python3-pip

# 安装 prometheus_client 库
pip3 install prometheus_client

# install loguru
pip3 install loguru

pip3 --version
