# Enable completion for aliases
compdef g=git
compdef d=docker
compdef dc='docker compose'
compdef k=kubectl
compdef t=tmux

## ls aliases
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

# python
alias python='python3'

# tmux ide function
function ide() {
    tmux split-window -v 
    tmux split-window -h 
    tmux resize-pane -D 10 
    tmux select-pane -t 0  
}

# system function - split into 4 panes
function t4() {
    tmux split-window -h
    tmux select-pane -t 0
    tmux split-window -v
    tmux select-pane -t 2
    tmux split-window -v
}

# tmux vc function - split right 20% and start claude
function vcc() {
    tmux split-window -h 'claude'
    tmux resize-pane -R 60
}

# Editor aliases
alias vi='nvim'
