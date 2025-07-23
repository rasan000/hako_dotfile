# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
  echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
  echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
  echo -e "${RED}[ERROR]${NC} $1"
}

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

print_status "Starting dotfiles installation..."
print_status "Script directory: $SCRIPT_DIR"

# Set non-interactive mode for apt
export DEBIAN_FRONTEND=noninteractive

# Update system
print_status "Updating system packages..."
sudo apt update && sudo apt upgrade -y

# Install essential build tools and compilers
print_status "Installing build essentials and compilers..."
sudo apt install -y build-essential gcc g++ clang make cmake git curl wget unzip

# Install Lua and LuaRocks (required for Mason's luacheck)
print_status "Installing Lua and LuaRocks..."
sudo apt install -y lua5.3 liblua5.3-dev luarocks

# Install zsh and set as default shell
print_status "Installing zsh..."
sudo apt install zsh -y

print_status "Setting zsh as default shell..."
if command -v zsh >/dev/null 2>&1; then
  print_warning "Please run 'chsh -s \$(which zsh)' manually after installation to set zsh as default shell"
  print_status "Zsh installed successfully."
else
  print_error "Failed to install zsh"
  exit 1
fi

# Install Oh My Zsh
print_status "Installing Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  print_status "Oh My Zsh installed successfully."
else
  print_status "Oh My Zsh already installed, skipping..."
fi

# Install Oh My Zsh plugins
print_status "Installing Oh My Zsh plugins..."
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

# zsh-autosuggestions
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
  print_status "zsh-autosuggestions installed."
fi

# zsh-syntax-highlighting
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
  print_status "zsh-syntax-highlighting installed."
fi

# powerlevel10k theme
if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
  print_status "powerlevel10k theme installed."
fi

# zenhan(for changeIME)
print_status "Installing zenhan for IME control..."
curl -fLO https://github.com/iuchim/zenhan/releases/download/v0.0.1/zenhan.zip
unzip -q zenhan.zip
chmod u+x zenhan/bin64/zenhan.exe
sudo mv zenhan/bin64/zenhan.exe /usr/local/bin/zenhan
rm -rf zenhan zenhan.zip

# pipx
print_status "Installing pipx..."
sudo apt install pipx -y

# neovim(AppImage)
print_status "Installing Neovim..."
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
sudo mkdir -p /opt/nvim
sudo mv nvim-linux-x86_64.appimage /opt/nvim/nvim
# Add to PATH if not already present
if ! grep -q "/opt/nvim" ~/.bashrc 2>/dev/null; then
  echo 'export PATH="$PATH:/opt/nvim/"' >>~/.bashrc
fi
if ! grep -q "/opt/nvim" ~/.zshrc 2>/dev/null; then
  echo 'export PATH="$PATH:/opt/nvim/"' >>~/.zshrc
fi

# lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm -lf lazygit.tar.gz lazygit

# terraform
# https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg |
  gpg --dearmor |
  sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg >/dev/null
gpg --no-default-keyring \
  --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
  --fingerprint
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" |
  sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt-get install terraform -y

# awscli sam cdk
print_status "Installing AWS CLI..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -q awscliv2.zip
sudo ./aws/install --update
rm -rf awscliv2.zip aws/

# AWS SAM CLI
pipx install aws-sam-cli

# AWS CDK
npm install -g aws-cdk

# azure
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# vim(+clipboard)
print_status "Installing vim with clipboard support..."
sudo apt remove vim vim-runtime vim-tiny -y
sudo apt install vim-gtk3 -y

# volta
print_status "Installing Volta and Node.js..."
export VOLTA_HOME="$HOME/.volta"
curl https://get.volta.sh | bash -s -- --skip-setup
export PATH="$VOLTA_HOME/bin:$PATH"
# Add volta to shell rc files if not present
if ! grep -q "VOLTA_HOME" ~/.bashrc 2>/dev/null; then
  echo 'export VOLTA_HOME="$HOME/.volta"' >>~/.bashrc
  echo 'export PATH="$VOLTA_HOME/bin:$PATH"' >>~/.bashrc
fi
if ! grep -q "VOLTA_HOME" ~/.zshrc 2>/dev/null; then
  echo 'export VOLTA_HOME="$HOME/.volta"' >>~/.zshrc
  echo 'export PATH="$VOLTA_HOME/bin:$PATH"' >>~/.zshrc
fi
$VOLTA_HOME/bin/volta install node

# Install global npm packages
print_status "Installing global npm packages..."
$VOLTA_HOME/bin/npm install -g aws-cdk typescript ts-node @anthropic-ai/claude-code

print_status "Linters and formatters will be automatically installed by Mason in Neovim"

print_status "Installation completed!"
print_warning "Please run 'chsh -s \$(which zsh)' to set zsh as your default shell."
print_warning "You may need to restart your terminal or run 'source ~/.zshrc' for all changes to take effect."
