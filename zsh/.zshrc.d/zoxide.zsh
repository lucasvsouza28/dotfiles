#!/bin/zsh
#
# .zoxide - install and source zoxide
#

source ~/.config/zsh/.zshrc.d/asdf_latest.zsh

if ! asdf plugin list | grep -q "zoxide"; then
  asdf_latest "zoxide"
fi

[[ -f "$(asdf which zoxide)" ]] && eval "$(zoxide init zsh)"
