# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Oh My Zsh configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
# Which plugins would you like to load?

plugins=(
  git
  z
  aws
  command-not-found
  colored-man-pages
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# History settings
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt CORRECT

unsetopt HIST_BEEP

# Disable beep sounds
unsetopt BEEP
unsetopt LIST_BEEP


# PATH exports
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/usr/local/bin/" # aws_cli_completer
export VOLTA_HOME="$HOME/.volta" # volta
export PATH="$VOLTA_HOME/bin" 
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Load aliases
DOTFILES_DIR="$(dirname "$(readlink -f "$HOME/.zshrc")")"
[ -f "$DOTFILES_DIR/aliases.zsh" ] && source "$DOTFILES_DIR/aliases.zsh"

# Alternative: Starship prompt (uncomment to use instead of powerlevel10k)
# eval "$(starship init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
if [[ -z "${MISE_SHELL}" ]]; then
  eval "$(~/.local/bin/mise activate zsh)"
fi

# fix vscode start failed error
# https://qiita.com/iwaiktos/items/33ab69a42c3a1cc35dfb
fix_wsl2_interop() {
    for i in $(pstree -np -s $$ | grep -o -E '[0-9]+'); do
        if [[ -e "/run/WSL/${i}_interop" ]]; then
            export WSL_INTEROP=/run/WSL/${i}_interop
        fi
    done
}

eval "$(uv generate-shell-completion bash)"
