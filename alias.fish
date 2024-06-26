# docker
alias d='docker'
alias dc='docker compose'
alias de='docker exec -it'
alias dcu='docker compose up -d'
alias dd='docker down'
alias dp='docker ps'

# kubectl
alias k='kubectl'
alias ke='kubectl exec -it'
alias kgp='kubectl get pod'
alias kd='kubectl describe pod'

# git
alias g='git'
alias lg='lazygit'

# tmux
alias t='tmux'
alias tse='tmux new -s'
alias tki='tmux kill-server'

# IDE風にターミナルを分割
function ide
    tmux split-window -v -p 25
    tmux split-window -h -p 50
end
