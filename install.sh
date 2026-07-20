#!/bin/bash
# Update system
sudo apt update && sudo apt upgrade -y

# Install essential build tools and compilers
sudo apt install -y build-essential gcc g++ clang make cmake git curl wget unzip

# Install Lua and LuaRocks (required for Mason's luacheck)
sudo apt install -y lua5.3 liblua5.3-dev luarocks

# Install clipboard tool
sudo apt install -y wl-clipboard

# Install ripgrep
sudo apt install -y ripgrep

# Install vim
sudo apt remove -y vim
sudo apt install -y vim-gtk3

# Install uv
curl -LsSf https://astral.sh/uv/install.sh | sh

# Install aws tools
sudo apt install -y awscli

# Install lazygit 
sudo apt install -y lazygit

# Install docker
sudo apt install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF
sudo apt updatedock
sudo apt -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Install k8s tools

# Install claude tools
curl -fsSL https://claude.ai/install.sh | bash

# Install zsh and set as default shell
sudo apt install -y zsh
chsh -s $(which zsh)

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  echo "Oh My Zsh already installed, skipping..."
fi

# install mise
if [ ! -f "$HOME/.local/bin/mise" ]; then
  curl https://mise.run | sh
else
  echo "mise already installed, skipping..."
fi

# install nvim from appimage
# Check if nvim is already installed
if ! command -v nvim &> /dev/null; then
  # Download the latest Neovim AppImage
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
  chmod u+x nvim-linux-x86_64.appimage
fi
sudo mkdir -p /opt/nvim
sudo mv nvim-linux-x86_64.appimage /opt/nvim/nvim

# Install Oh My Zsh plugins
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
else
  echo "zsh-autosuggestions already installed, skipping..."
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
else
  echo "zsh-syntax-highlighting already installed, skipping..."
fi

if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
else
  echo "powerlevel10k already installed, skipping..."
fi
# Install Starship prompt
if ! command -v starship &> /dev/null; then
  curl -fsSL https://starship.rs/install.sh | sh -s -- -y
else
  echo "Starship already installed, skipping..."
fi 
