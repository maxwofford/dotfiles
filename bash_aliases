# some ls aliases
alias ls='ls --color=auto'
alias la='ls -a'
alias l='ls -CF'
alias ll='ls -alF'

alias tmuxa='tmux attach -t'
alias tmuxsource='tmux source-file ~/.tmux.conf'
alias pserv='python3 -m http.server'
alias pin='ping 8.8.8.8'
alias killport='fuser -k -n tcp '
alias crone='crontab -e'
alias jserv='sudo browser-sync start --port $PORT --server --files "**"'

echo 'aliases sourced'
