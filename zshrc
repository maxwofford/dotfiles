# Path to your oh-my-zsh installation.
export ZPATH=/home/maxw/.zsh
export ZSH=/home/maxw/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="/home/maxw/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
# export MANPATH="/usr/local/man:$MANPATH"

# Make sure there is a .zsh folder to put our scripts in
if [ -z "$ZPATH" ]; then
  mkdir "$ZPATH"
fi

# Make sure there is a .oh-my-zsh folder to put our scripts in
if [ -z "$ZSH" ]; then
  mkdir "$ZSH"
fi

# Source oh-my-zsh
if [ -z "$ZSH" ]; then
  git clone https://github.com/robbyrussell/oh-my-zsh "$ZSH"
fi
source "$ZSH/oh-my-zsh.sh"

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
