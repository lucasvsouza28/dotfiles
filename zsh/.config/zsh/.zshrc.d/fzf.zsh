#!/bin/zsh
#
# .fzf - install and source fzf
#
if ! command -v fzf >/dev/null 2>&1; then
  mise use -g fzf
fi
[[ $(command -v "fzf") ]] && source <(fzf --zsh)
