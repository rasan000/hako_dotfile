#!/bin/bash
# Update system
sudo apt update && sudo apt upgrade -y

# Install essential build tools and compilers
sudo apt install -y build-essential gcc g++ clang make cmake git curl wget unzip

# Install Lua and LuaRocks (required for Mason's luacheck)
sudo apt install -y lua5.3 liblua5.3-dev luarocks

# Install grep
sudo apt install -y repgrep

# Install zsh and set as default shell
sudo apt install zsh -y

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# install mise
curl https://mise.run | sh
echo 'eval "$(~/.local/bin/mise activate zsh)"' >>~/.zshrc

# Install Oh My Zsh plugins
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"

# zenhan(for changeIME)
curl -fLO https://github.com/iuchim/zenhan/releases/download/v0.0.1/zenhan.zip
unzip -q zenhan.zip
chmod u+x zenhan/bin64/zenhan.exe
sudo mv zenhan/bin64/zenhan.exe /usr/local/bin/zenhan
rm -rf zenhan zenhan.zip

# npm modulese
npm install -g aws-cdk
npm install -g typescript ts-node
npm install -g prettier @typescript-eslint/eslint-plugin @typescript-eslint/parser eslint
npm install -g @anthropic-ai/claude-code
