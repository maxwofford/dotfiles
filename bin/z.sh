# z - directory jumper
# Add this to your .zshrc or .bashrc:
#   source /path/to/z.sh

# Path to the z binary (in ~/.bin via rcup)
_Z_BIN="${_Z_BIN:-$HOME/.bin/z}"

# Hook into cd to track directories
_z_add() {
  "$_Z_BIN" --add "$PWD" 2>/dev/null
}

# Override cd to track directories
cd() {
  builtin cd "$@" && _z_add
}

# The z function - replaces cd entirely
# If arg is a valid path, cd there. Otherwise, try frecent match.
z() {
  if [ -z "$1" ]; then
    # No args = go home (like cd)
    builtin cd ~ && _z_add
    return
  fi

  # If it's a valid directory, cd directly
  if [ -d "$1" ]; then
    builtin cd "$1" && _z_add
    return
  fi

  # Otherwise, try frecent match
  local target
  target=$("$_Z_BIN" "$1")

  if [ -n "$target" ]; then
    builtin cd "$target" && _z_add
  else
    echo "z: no match for '$1'"
    return 1
  fi
}
