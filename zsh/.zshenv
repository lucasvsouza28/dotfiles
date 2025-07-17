#### antidote ####
export ZDOTDIR=~/.config/zsh # (note) path != path in string

#### bun ####
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

#### asdf ####
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"