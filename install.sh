# インストール時に実行する
sudo apt update
sudo apt upgrade

# pipx
sudo apt install pipx

# neovim
sudo snap install nvim #classic

# lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin


# terraform 
# https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt-get install terraform

# windows path(code & docker)


# ElasticSearch
#https://www.elastic.co/guide/en/elasticsearch/reference/7.15/deb.html#deb-repo

# kibana
#https://www.elastic.co/guide/en/kibana/current/deb.html
# ./bin/elasticsearch-plugin install analysis-kuromoji

# awscli sam cdk


# azure
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# vim(+clipboard) 
sudo apt remove vim vim-runtime vim-tiny
sudo apt install vim-gtk3 -y

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
