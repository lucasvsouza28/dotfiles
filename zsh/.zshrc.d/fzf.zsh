#!/bin/zsh
#
# .fzf - install and source fzf
#

source ./asdf_latest.zsh

if ! asdf plugin list | grep -q "fzf"; then
  asdf_latest fzf
fi

[[ -f "$(asdf where fzf)/shell/key-bindings.zsh" ]] && source "$(asdf where fzf)/shell/key-bindings.zsh"
