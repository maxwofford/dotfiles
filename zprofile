eval "$(/opt/homebrew/bin/brew shellenv)"

# Terminal configuration
export TERM=xterm-256color
export COLORTERM=truecolor

# Load solarized colors for ls
if [[ -f "$HOME/.dotfiles/solarized-colors" ]]; then
  source "$HOME/.dotfiles/solarized-colors"
fi

export PATH="$HOME/.bin:$PATH"
EDITOR="vim"
. "$HOME/.dotfiles/aliases"
. "$HOME/.bin/z.sh"

  export BUN_INSTALL="$HOME/.bun" 
  export PATH="$BUN_INSTALL/bin:$PATH"

# Created by `pipx` on 2025-01-06 00:52:40
export PATH="$PATH:/Users/maxwofford/.local/bin"

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
