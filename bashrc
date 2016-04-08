#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]$(__git_ps1 "\[\033[01;33m\][%s]\[\033[00m\]")\$ '

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

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ ! -f ~/.git-completion.bash ]; then
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ~/.git-completion.bash
  echo '~/.git-completion.bash downloaded!'
fi
. ~/.git-completion.bash

if [ ! -f ~/.hub.bash_completion.sh ]; then
  curl https://raw.githubusercontent.com/github/hub/master/etc/hub.bash_completion.sh > ~/.hub.bash_completion.sh
  echo '~/.hub.bash_completion.sh downloaded!'
fi
. ~/.hub.bash_completion.sh

if [ ! -f ~/.git-prompt.sh ]; then
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > ~/.git-prompt.sh
  echo '~/.git-prompt.sh downloaded!'
fi
. ~/.git-prompt.sh

if [ ! -f ~/.concurrent.lib.sh ]; then
  curl https://raw.githubusercontent.com/themattrix/bash-concurrent/master/concurrent.lib.sh > ~/.concurrent.lib.sh
  echo '~/.concurrent.lib.sh downloaded!'
fi
. ~/.concurrent.lib.sh

if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi
