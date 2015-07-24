# some ls aliases
alias ls='ls --color=auto'
alias la='ls -a'
alias l='ls -CF'
alias ll='ls -alF'

# alias aliases
alias ae='vim ~/.bash_aliases'
alias ar='. ~/.bash_aliases'

# git aliases
alias g='git'

# misc aliases
alias ~='cd ~'
alias ..='cd ..'
alias crone='crontab -e'
alias jserv='sudo browser-sync start --port $PORT --server --files "**"'
alias killport='fuser -k -n tcp '
alias pin='ping 8.8.8.8'
alias prettyjson='python3 -m json.tool'
alias pserv='python3 -m http.server'
alias tmuxa='tmux attach -t'
alias tmuxsource='tmux source-file ~/.tmux.conf'

echo 'aliases sourced'
