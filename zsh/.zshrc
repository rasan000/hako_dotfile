# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Oh My Zsh configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
# Which plugins would you like to load?

plugins=(
  git
  aws
  docker
  kubectl
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
unsetopt HIST_BEEP

# Disable beep sounds
unsetopt BEEP
unsetopt LIST_BEEP


# PATH exports
export PATH="$PATH:$HOME/.local/bin"
# export PATH="$PATH:/opt/nvim/"
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Load aliases
DOTFILES_DIR="$(dirname "$(readlink -f "$HOME/.zshrc")")"
[ -f "$DOTFILES_DIR/aliases.zsh" ] && source "$DOTFILES_DIR/aliases.zsh"

# Alternative: Starship prompt (uncomment to use instead of powerlevel10k)
# eval "$(starship init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval "$(~/.local/bin/mise activate zsh)"
