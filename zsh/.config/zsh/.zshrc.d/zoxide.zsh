#!/bin/zsh
#
# .zoxide - install and source zoxide
#

if ! command -v zoxide >/dev/null 2>&1; then
    mise use -g zoxide
fi
[[ $(command -v "zoxide") ]] && eval "$(zoxide init zsh)"
