# alias aliases
alias ae='vim ~/.bash_aliases'
alias ar='. ~/.bash_aliases'

# cd aliases
alias ..='cd ..'
alias ~='cd ~'

# git aliases
alias g='git'
alias gb='git branch'
alias gbdone='git bdone'
alias gcob='git checkout -b'
alias gd='git diff'
alias gs='git status'

# ls aliases
alias l='ls -CF'
alias la='ls -a'
alias ll='ls -alF'
alias ls='ls --color=auto'

# tmux aliases
alias tmuxa='tmux attach -dt'
alias tmuxsource='tmux source-file ~/.tmux.conf'

# misc aliases
alias crone='crontab -e'
alias installhistory='cat /var/log/dpkg.log | grep "\ install\ "'
alias jserv='sudo browser-sync start --port $PORT --server --files "**"'
alias killport='fuser -k -n tcp '
alias mkdir='mkdir -p'
alias pin='ping 8.8.8.8'
alias prettyjson='python3 -m json.tool'
alias pserv='python3 -m http.server'

echo 'aliases sourced'
