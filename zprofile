eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="$HOME/.bin:$PATH"
EDITOR="vim"
. "$HOME/.dotfiles/aliases"
. "$HOME/.bin/z.sh"

  export BUN_INSTALL="$HOME/.bun" 
  export PATH="$BUN_INSTALL/bin:$PATH"
