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
alias kdp='kubectl describe pod'
alias kvs='kubectl view-secret -a'

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


#sdkmanのパス
# sdk command
function sdk
        bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && sdk $argv"
end

# add paths
for ITEM in $HOME/.sdkman/candidates/* ;
        set -gx PATH $PATH $ITEM/current/bin
end

