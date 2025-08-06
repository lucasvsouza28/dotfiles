#### antidote ####
export ZDOTDIR=~/.config/zsh # (note) path != path in string

#### asdf ####
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

 # Ensure path arrays do not contain duplicates.
typeset -gU path fpath

# Set the list of directories that zsh searches for commands.
path=(
  $HOME/{,s}bin(N)
  $HOME/.local/{,s}bin(N)
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
  $path
)
