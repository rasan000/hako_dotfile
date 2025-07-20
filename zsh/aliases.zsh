# ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# grep aliases with color support
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# git aliases (migrated from .gitconfig and .aliases)
alias g='git'
alias lg='lazygit'

# Enable completion for aliases
compdef g=git
compdef d=docker
compdef dc='docker compose'
compdef k=kubectl
compdef t=tmux

# docker aliases
alias d='docker'
alias dc='docker compose'
alias de='docker exec -it'
alias dcu='docker compose up -d'
alias dd='docker down'
alias dp='docker ps'

# kubectl aliases
alias k='kubectl'
alias ke='kubectl exec -it'
alias kgp='kubectl get pod'
alias kdp='kubectl describe pod'
alias kvs='kubectl view-secret -a'

# tmux aliases
alias t='tmux'
alias tse='tmux new -s'
alias tki='tmux kill-server'

# tmux ide function
function ide() {
    tmux split-window -v 
    tmux split-window -h 
    tmux resize-pane -D 10 
    tmux select-pane -t 0  
}

# tmux vc function - split right 20% and start claude
function vc() {
    tmux split-window -h 'claude'
    tmux resize-pane -R 60
}

# Useful aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Directory listing with better defaults
alias lh='ls -lah'
alias lt='ls -lath'
alias ltr='ls -latr'

# Git shortcuts
alias gst='git status'
alias gd='git diff'
alias gaa='git add .'
alias gcm='git commit -m'
alias gp='git push'
alias gl='git pull'

# System monitoring
alias ports='netstat -tulanp'
alias meminfo='free -m -l -t'
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'

# Quick file operations
alias mkdir='mkdir -pv'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'

# Network utilities
alias ping='ping -c 5'
alias fastping='ping -c 100 -s.2'
alias myip='curl -s ifconfig.me'

# Editor aliases
alias vim='nvim'
alias vi='nvim'
