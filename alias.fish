# docker
alias dc='docker compose'
alias dexec='docker exec -it'
alias dup='docker compose up -d'

# alias down='docker exec -it'
alias dps='docker ps'

# kubectl
alias k='kubectl'
alias kexec='kubectl exec -it'
alias kget='kubectl get pod'
alias kdesc='kubectl describe pod'

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
