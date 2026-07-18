# grep aliases with color support
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# git aliases
alias g='git'
alias lg='lazygit'

# docker aliases
alias d='docker'
alias dc='docker compose'
alias de='docker exec -it'
alias dcu='docker compose up -d'
alias dddown='docker down'
alias dp='docker ps'

# kubectl aliases
alias k='kubectl'
alias ke='kubectl exec -it'
alias kgp='kubectl get pod'
alias kdp='kubectl describe pod'

# tmux aliases
alias t='tmux'
alias tse='tmux new -s'
alias tki='tmux kill-server'

# tmux ide function
ide() {
    tmux split-window -v
    tmux split-window -h
    tmux resize-pane -D 10
    tmux select-pane -t 0
}
