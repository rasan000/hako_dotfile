# Dotfiles installation Makefile
DOTFILES_DIR := $(shell pwd)
HOME_DIR := $(HOME)

.PHONY: install uninstall setup

# Full setup: install packages and dotfiles
setup:
	@echo "Running setup..."
	@bash $(DOTFILES_DIR)/install.sh
	@$(MAKE) install

# Install dotfiles only
install: uninstall
	@echo "Installing dotfiles..."
	@ln -sfn $(DOTFILES_DIR)/mise $(HOME_DIR)/.config/mise
	@ln -sfn $(DOTFILES_DIR)/.vimrc $(HOME_DIR)/.vimrc
	@ln -sfn $(DOTFILES_DIR)/.tmux.conf $(HOME_DIR)/.tmux.conf
	@ln -sfn $(DOTFILES_DIR)/bash/.bashrc $(HOME_DIR)/.bashrc
	@ln -sfn $(DOTFILES_DIR)/bash/.bash_aliases $(HOME_DIR)/.bash_aliases
	@$(MAKE) gitconfig
	@cd ~ && mise install
	@echo "Dotfiles installed successfully!"

# Setup gitconfig include
gitconfig:
	@echo "Setting up .gitconfig..."
	@if ! grep -q "path = $(DOTFILES_DIR)/.gitconfig" $(HOME_DIR)/.gitconfig 2>/dev/null; then \
		if ! grep -q "^\[include\]" $(HOME_DIR)/.gitconfig 2>/dev/null; then \
			echo "[include]" >> $(HOME_DIR)/.gitconfig; \
		fi; \
		echo "    path = $(DOTFILES_DIR)/.gitconfig" >> $(HOME_DIR)/.gitconfig; \
		echo "Added include for dotfiles .gitconfig"; \
	else \
		echo "Dotfiles .gitconfig already included"; \
	fi

# Remove all symlinks
uninstall:
	@echo "Removing dotfile symlinks..."
	@rm -f $(HOME_DIR)/.vimrc
	@rm -f $(HOME_DIR)/.tmux.conf
	@rm -f $(HOME_DIR)/.bashrc
	@rm -f $(HOME_DIR)/.bash_aliases
	@rm -rf $(HOME_DIR)/.config/mise
	@echo "Symlinks removed!"
