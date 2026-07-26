# Enable completion for aliases
compdef g=git
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
alias ddown='docker down'
alias dp='docker ps'

# kubectl aliases
alias k='kubectl'
alias ke='kubectl exec -it'
alias kgp='kubectl get pod'
alias kdp='kubectl describe pod'
alias kvs='kubectl view-secret -a'

# tmux aliases
alias t='tmux'
alias tkp='tmus kill-pane -a'
alias tki='tmux kill-server'
ide() {
    tmux rename-window "IDE"
    tmux split-window -h -p 30    # 右列(30%)を作成
    tmux select-pane -L           # 左列に戻る
    # tmux split-window -v -p 30    # 左列を上下分割(下30%)
    tmux select-pane -R           # 右列(上)に移動
    tmux split-window -v -p 50    # 右列を上下分割(50/50)
    tmux select-pane -U           # 右列の上に移動
    tmux select-pane -L           # 左上（最大ペイン）に移動
}

# terraform aliases
alias tf='terraform'
