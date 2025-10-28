#!/bin/bash
# Update system
sudo apt update && sudo apt upgrade -y

# Install essential build tools and compilers
sudo apt install -y build-essential \
gcc \
g++ \
clang \
make \
cmake \
git \
curl \
wget \
unzip

# Install grep
sudo apt install -y ripgrep

# install mise
curl https://mise.run | sh
