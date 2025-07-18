## inital setup
`cd ~/.config`
`git init`
`git remote add origin <repo_url>`
`git pull origin main`

## tools

### required tools
- asdf

> optional: enable asdf completions:
mkdir -p "${ASDF_DATA_DIR:-$HOME/.asdf}/completions"
asdf completion zsh > "${ASDF_DATA_DIR:-$HOME/.asdf}/completions/_asdf"

### optional tools
- fzf
