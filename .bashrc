#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
alias cargo run='cargo build && ./main'
