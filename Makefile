# Dotfiles installation Makefile

# Variables
DOTFILES_DIR := $(shell pwd)
HOME_DIR := $(HOME)

# Targets for dotfiles
.PHONY: all setup install packages clean uninstall help

all: install

setup: packages install

packages:
	@echo "Installing packages..."
	@chmod +x $(DOTFILES_DIR)/install.sh
	@$(DOTFILES_DIR)/install.sh

help:
	@echo "Available targets:"
	@echo "  setup     - Full setup (packages + dotfiles)"
	@echo "  packages  - Install packages only"
	@echo "  install   - Install dotfiles only"
	@echo "  clean     - Remove broken symlinks"
	@echo "  uninstall - Remove all symlinks"
	@echo "  help      - Show this help message"

install: clean $(HOME_DIR)/.config
	@echo "Creating symlinks for dotfiles..."
	@if [ -f $(HOME_DIR)/.vimrc ] && [ ! -L $(HOME_DIR)/.vimrc ]; then \
		echo "Backing up existing .vimrc to .vimrc.backup"; \
		mv $(HOME_DIR)/.vimrc $(HOME_DIR)/.vimrc.backup; \
	fi
	@ln -sfn $(DOTFILES_DIR)/.vimrc $(HOME_DIR)/.vimrc
	@if [ -f $(HOME_DIR)/.tmux.conf ] && [ ! -L $(HOME_DIR)/.tmux.conf ]; then \
		echo "Backing up existing .tmux.conf to .tmux.conf.backup"; \
		mv $(HOME_DIR)/.tmux.conf $(HOME_DIR)/.tmux.conf.backup; \
	fi
	@ln -sfn $(DOTFILES_DIR)/.tmux.conf $(HOME_DIR)/.tmux.conf
	@if [ -f $(HOME_DIR)/.zshrc ] && [ ! -L $(HOME_DIR)/.zshrc ]; then \
		echo "Backing up existing .zshrc to .zshrc.backup"; \
		mv $(HOME_DIR)/.zshrc $(HOME_DIR)/.zshrc.backup; \
	fi
	@ln -sfn $(DOTFILES_DIR)/zsh/.zshrc $(HOME_DIR)/.zshrc
	@if [ -f $(HOME_DIR)/.p10k.zsh ] && [ ! -L $(HOME_DIR)/.p10k.zsh ]; then \
		echo "Backing up existing .p10k.zsh to .p10k.zsh.backup"; \
		mv $(HOME_DIR)/.p10k.zsh $(HOME_DIR)/.p10k.zsh.backup; \
	fi
	@ln -sfn $(DOTFILES_DIR)/zsh/.p10k.zsh $(HOME_DIR)/.p10k.zsh
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
	@rm -f $(HOME_DIR)/.zshrc
	@rm -f $(HOME_DIR)/.p10k.zsh
	@rm -f $(HOME_DIR)/.config/nvim
	@echo "Symlinks removed!"

# Ensure .config directory exists
$(HOME_DIR)/.config:
	@mkdir -p $(HOME_DIR)/.config

install: $(HOME_DIR)/.config
