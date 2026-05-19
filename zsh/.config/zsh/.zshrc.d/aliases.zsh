#!/bin/zsh
#
# .aliases - Set whatever shell aliases you want.
#

if command -v bat >/dev/null 2>&1; then
  alias cat='bat'
elif command -v batcat >/dev/null 2>&1; then
  alias bat="batcat"
  alias cat='batcat'
fi

alias la='eza -lahg --icons --group-directories-first' # eza l=long, a=all, h=header,=group
alias tree='eza --tree --icons --group-directories-first'

alias n="nvim"
