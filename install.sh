#!/bin/bash
# Update system
sudo apt update && sudo apt upgrade -y

# Install essential build tools and compilers
sudo apt install -y build-essential gcc g++ clang make cmake git curl wget unzip

# Install Lua and LuaRocks (required for Mason's luacheck)
sudo apt install -y lua5.3 liblua5.3-dev luarocks

# Install ripgrep
sudo apt install -y ripgrep

# Install zsh and set as default shell
sudo apt install zsh -y
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
