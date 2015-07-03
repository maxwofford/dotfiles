# some ls aliases
alias ls='ls --color=auto'
alias la='ls -a'
alias l='ls -CF'
alias ll='ls -alF'

# misc aliases
alias ..='cd ..'
alias crone='crontab -e'
alias jserv='sudo browser-sync start --port $PORT --server --files "**"'
alias killport='fuser -k -n tcp '
alias pin='ping 8.8.8.8'
alias pserv='python3 -m http.server'
alias tmuxa='tmux attach -t'
alias tmuxsource='tmux source-file ~/.tmux.conf'

echo 'aliases sourced'
