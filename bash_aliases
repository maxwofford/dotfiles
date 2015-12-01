# alias aliases
alias ae="$EDITOR ~/.bash_aliases"
alias ar='. ~/.bash_aliases'

# cd aliases
alias ..='cd ..'
alias ~='cd ~'

# git aliases
alias g='git'
alias gb='git branch'
alias ga='git add'
alias gbdone='git bdone'
alias gcob='git checkout -b'
alias gcom='git commit'
alias gd='git diff'
alias gl='git log'
alias gpull='git pull'
alias gpush='git push'
alias gr='git rebase'
alias gs='git status'

# ls aliases
alias l='ls -CF'
alias la='ls -a'
alias ll='ls -alF'
alias ls='ls --color=auto'

# tmux aliases
alias tmux='tmux -2'
alias tmuxa='tmux attach -dt'
alias tmuxsource='tmux source-file ~/.tmux.conf'

# misc aliases
alias crone="$EDITOR ~/.dotfiles/crontab && crontab ~/.dotfiles/crontab"
alias installhistory='cat /var/log/dpkg.log | grep "\ install\ "'
alias jserv='sudo browser-sync start --port $PORT --server --files "**"'
alias killport='fuser -k -n tcp '
alias mkdir='mkdir -p'
alias pin='ping 8.8.8.8'
alias prettyjson='python3 -m json.tool'
alias pserv='python3 -m http.server'
alias i3reload='i3-msg -t command restart'
alias fontreload='fc-cache -f -v'
alias hubot='bin/hubot'
