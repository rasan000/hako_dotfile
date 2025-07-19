# Dotfiles installation Makefile

# Variables
DOTFILES_DIR := $(shell pwd)
HOME_DIR := $(HOME)

# Targets for dotfiles
.PHONY: all setup install clean uninstall help

all: install

help:
	@echo "Available targets:"
	@echo "  install   - Create symlinks for all dotfiles"
	@echo "  clean     - Remove broken symlinks"
	@echo "  uninstall - Remove all symlinks"
	@echo "  help      - Show this help message"

install: clean
	@echo "Creating symlinks for dotfiles..."
	@ln -sfn $(DOTFILES_DIR)/.vimrc $(HOME_DIR)/.vimrc
	@ln -sfn $(DOTFILES_DIR)/.tmux.conf $(HOME_DIR)/.tmux.conf
	@ln -sfn $(DOTFILES_DIR)/.gitconfig $(HOME_DIR)/.gitconfig
	@ln -sfn $(DOTFILES_DIR)/.gitconfig_alias $(HOME_DIR)/.gitconfig_alias
	@ln -sfn $(DOTFILES_DIR)/nvim $(HOME_DIR)/.config/nvim
	@echo "Symlinks created successfully!"

clean:
	@echo "Cleaning broken symlinks..."
	@find $(HOME_DIR) -maxdepth 1 -name ".*" -type l ! -exec test -e {} \; -delete 2>/dev/null || true
	@find $(HOME_DIR)/.config -maxdepth 1 -name "nvim" -type l ! -exec test -e {} \; -delete 2>/dev/null || true

uninstall:
	@echo "Removing dotfile symlinks..."
	@rm -f $(HOME_DIR)/.vimrc
	@rm -f $(HOME_DIR)/.tmux.conf
	@rm -f $(HOME_DIR)/.gitconfig
	@rm -f $(HOME_DIR)/.gitconfig_alias
	@rm -f $(HOME_DIR)/.config/nvim
	@echo "Symlinks removed!"

# Ensure .config directory exists
$(HOME_DIR)/.config:
	@mkdir -p $(HOME_DIR)/.config

install: $(HOME_DIR)/.config
