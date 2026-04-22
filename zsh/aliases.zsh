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
alias tse='tmux new -s'
alias tki='tmux kill-server'

# terraform aliases
alias tf='terraform'