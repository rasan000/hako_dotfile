# Dotfiles installation Makefile
# Variables
DOTFILES_DIR := $(shell pwd)
HOME_DIR := $(HOME)

# Targets for dotfiles
WINDOWS_USER := $(shell cmd.exe /c "echo %USERNAME%" 2>/dev/null | tr -d '\r\n')
VSCODE_SETTINGS_SRC := /mnt/c/Users/$(WINDOWS_USER)/AppData/Roaming/Code/User/settings.json
VSCODE_SETTINGS_DST := $(DOTFILES_DIR)/vscode/settings.json

.PHONY: install uninstall backup-vscode

install: 
	# remove symlinks
	@make uninstall
	# install sh file
	@sh install.sh
	# make mise symlink
	@ln -sfn $(DOTFILES_DIR)/mise $(HOME_DIR)/.config/mise
	@ln -sfn $(DOTFILES_DIR)/.vimrc $(HOME_DIR)/.vimrc
	@ln -sfn $(DOTFILES_DIR)/.tmux.conf $(HOME_DIR)/.tmux.conf
	@ln -sfn $(DOTFILES_DIR)/zsh/.zshrc $(HOME_DIR)/.zshrc
	@ln -sfn $(DOTFILES_DIR)/bash/.bashrc $(HOME_DIR)/.bashrc
	@ln -sfn $(DOTFILES_DIR)/bash/.bash_aliases $(HOME_DIR)/.bash_aliases
	@ln -sfn $(DOTFILES_DIR)/zsh/.p10k.zsh $(HOME_DIR)/.p10k.zsh
	@ln -sfn $(DOTFILES_DIR)/nvim $(HOME_DIR)/.config/nvim
	# setting gitconfig
	@echo "Setting up .gitconfig..."
	@if [ ! -f $(HOME_DIR)/.gitconfig ]; then \
		echo "Creating new .gitconfig"; \
		touch $(HOME_DIR)/.gitconfig; \
	fi
	@if ! grep -q "path = $(DOTFILES_DIR)/.gitconfig" $(HOME_DIR)/.gitconfig 2>/dev/null; then \
		echo "[include]" >> $(HOME_DIR)/.gitconfig; \
		echo "    path = $(DOTFILES_DIR)/.gitconfig" >> $(HOME_DIR)/.gitconfig; \
		echo "Added include for dotfiles .gitconfig"; \
	else \
		echo "Dotfiles .gitconfig already included"; \
	fi
	# mise install
	@ cd ~ && mise install
	@echo "Install and Symlinks created!"

backup-vscode:
	@mkdir -p $(DOTFILES_DIR)/vscode
	@cp /mnt/c/Users/$(WINDOWS_USER)/AppData/Roaming/Code/User/settings.json    $(DOTFILES_DIR)/vscode/settings.json
	@cp /mnt/c/Users/$(WINDOWS_USER)/AppData/Roaming/Code/User/keybindings.json $(DOTFILES_DIR)/vscode/keybindings.json
	@echo "VSCode settings backed up to vscode/"

uninstall:
	@echo "Removing dotfile symlinks..."
	@rm -f $(HOME_DIR)/.vimrc
	@rm -f $(HOME_DIR)/.tmux.conf
	@rm -f $(HOME_DIR)/.zshrc
	@rm -f $(HOME_DIR)/.p10k.zsh
	@rm -f $(HOME_DIR)/.bashrc
	@rm -f $(HOME_DIR)/.bash_aliases
	@rm -rf $(HOME_DIR)/.config/nvim
	@rm -rf $(HOME_DIR)/.config/mise
	@echo "Symlinks removed!"
