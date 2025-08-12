#!/bin/zsh

if [[ ! -d $(asdf where fzf) ]]; then
  asdf plugin add fzf \
  asdf install fzf latest \
  asdf set -u fzf latest
fi
