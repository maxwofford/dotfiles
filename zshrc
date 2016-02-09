# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# User configuration

export PATH="/home/maxw/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
# export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='e'
fi

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
source ~/.aliases

# Tmux configuration
# Only run this when tmux server is running
if tmux info &> /dev/null; then
  # Make sure the configuration file exists and source it
  [[ -f ~/.tmux.conf ]] && tmux -q source-file ~/.tmux.conf
fi

# Computer specific configuration
# Only source this file if it exists
[[ -f ~/.bash_specific ]] && source ~/.bash_specific

# Z.sh file searching
# Only source this file if it exists
if [ ! -f ~/.z.sh ]; then
  curl https://raw.githubusercontent.com/rupa/z/master/z.sh > ~/.z.sh
  echo '~/.z.sh downloaded!'
fi
. ~/.z.sh

if [ ! -f ~/.concurrent.lib.sh ]; then
  curl https://raw.githubusercontent.com/themattrix/bash-concurrent/master/concurrent.lib.sh > ~/.concurrent.lib.sh
  echo '~/.concurrent.lib.sh downloaded!'
fi
. ~/.concurrent.lib.sh
