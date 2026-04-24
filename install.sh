#!/bin/bash
# Update system
sudo apt update && sudo apt upgrade -y

# Install essential build tools and compilers
sudo apt install -y build-essential gcc g++ clang make cmake git curl wget unzip

# Install Lua and LuaRocks (required for Mason's luacheck)
sudo apt install -y lua5.3 liblua5.3-dev luarocks

# Install ripgrep
sudo apt install -y ripgrep

# Install vim
sudo apt remove -y vim
sudo apt install -y vim-gtk3

# Install

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
  curl -LO https://github.com/neovim/neovim/releases/download/v0.11.1/nvim-linux-x86_64.appimage 
  chmod u+x nvim-linux-x86_64.appimage
  sudo mv ./nvim-linux-x86_64.appimage /usr/bin/nvim
fi

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
