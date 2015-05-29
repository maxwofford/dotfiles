# some ls aliases
alias ls='ls --color=auto'
alias la='ls -a'
alias l='ls -CF'
alias ll='ls -alF'

alias tmuxa='tmux attach -t'
alias tmuxsource='tmux source-file ~/.tmux.conf'
alias pserv='python -m SimpleHTTPServer'
alias pin='ping 8.8.8.8'
alias killport="fuser -k -n tcp "

echo 'aliases sourced'
