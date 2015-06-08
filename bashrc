#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# don't put duplicate lines or lines starting with space in the history
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

#  make less more friendly for non-text input files, see lesspipe
[ -x /usr/bin/lesspipe  ] && eval "$(SHELL=/bin/sh lesspipe)"

# SOURCE ALL THE THINGS!!!
if [ -f ~/.bash_specific ]; then
  . ~/.bash_specific
fi

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

if [ -f ~/.hub.bash_completion.sh ]; then
  . ~/.hub.bash_completion.sh
fi

if [ -f ~/.z.sh ]; then
  . ~/.z.sh
fi

if [ -f ~/.tmux.conf ]; then
  tmux source-file ~/.tmux.conf -q
fi

PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '

# have some fun with fortune telling cows
if hash fortune 2>/dev/null; then
  if hash cowsay 2>/dev/null; then
    if hash lolcat 2>/dev/null; then
      fortune | cowsay | lolcat
    else
      fortune | cowsay
    fi
  else
    fortune
  fi
fi
echo '.bashrc sourced!'
