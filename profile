#
# ~/.profile
#

#################
# Env variables #
#################

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='e'
fi

if [ "$TERM" = "xterm" ]; then
  TERM=xterm-256color
fi
if [ "$TERM" = "screen" -o "$TERM" = "screen-256color" ]; then
  TERM=screen-256color
fi

export NVM_DIR="$HOME/.nvm"
export RVM="$HOME/.rvm/scripts/rvm"

########
# PATH #
########

# Add ~/.bin to path
PATH="$HOME/.bin:$PATH"
# Add heroku to path
PATH="/usr/local/heroku/bin:$PATH"
# Add RVM to path
PATH="$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting

#################
# Source things #
#################

# Load NVM
if [ -d $NVM_DIR ]; then
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
fi
# Load RVM
[[ -s "$HOME/.rvm" ]] && . "$HOME/.rvm/scripts/rvm"
# Z.sh file searching
if [ ! -f ~/.z.sh ]; then
  curl https://raw.githubusercontent.com/rupa/z/master/z.sh > ~/.z.sh
  echo '~/.z.sh downloaded!'
fi
. ~/.z.sh

[[ -f ~/.aliases ]] && . ~/.aliases

if tmux info &> /dev/null; then
  [[ -f ~/.tmux.conf ]] && tmux -q source-file ~/.tmux.conf
fi

[[ -f ~/.finrc ]] && . ~/.finrc

######################################
# Shell specific configuration files #
######################################

if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
	  . "$HOME/.bashrc"
  fi
fi

if [ -n "$ZSH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.zshrc" ]; then
	  . "$HOME/.zshrc"
  fi
fi
