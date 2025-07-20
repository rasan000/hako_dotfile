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
  history-substring-search
  colored-man-pages
  extract
  web-search
  command-not-found
  z
  sudo
  copypath
  copyfile
  dirhistory
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

# Directory navigation
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

# Completion improvements
setopt COMPLETE_ALIASES
setopt GLOB_COMPLETE
setopt NO_CASE_GLOB
setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
setopt AUTO_LIST            # Automatically list choices on ambiguous completion
setopt COMPLETE_IN_WORD     # Complete from both ends of a word

# Disable beep sounds
unsetopt BEEP
unsetopt LIST_BEEP

# Spelling correction
setopt CORRECT              # Correct commands
setopt CORRECT_ALL          # Correct all arguments

# Job control
setopt AUTO_RESUME          # Resume jobs with their name
setopt LONG_LIST_JOBS       # List jobs in the long format
setopt NOTIFY               # Report status of background jobs immediately

# PATH exports
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/opt/nvim/"

# Volta configuration
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Load aliases
DOTFILES_DIR="$(dirname "$(readlink -f "$HOME/.zshrc")")"
[ -f "$DOTFILES_DIR/aliases.zsh" ] && source "$DOTFILES_DIR/aliases.zsh"

# Alternative: Starship prompt (uncomment to use instead of powerlevel10k)
# eval "$(starship init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
