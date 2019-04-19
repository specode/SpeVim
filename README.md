## About

This is my personally use neovim config.

My main work on Go, PHP, You can fork this repositorie and modify it until you like.

_The config only test on macOS + iTerm2 + neovim + php 7._

## Quick Start (macOS)

1.  Install plugins dependencies:

    - neovim python support: `pip2 install neovim` && `pip3 install neovim`
    - vim-plug: see https://github.com/junegunn/vim-plug
    - Ag for code search and speed up ctrlp: `brew install the_silver_searcher`
    - upgrade ctags for tagbar: `brew install ctags`
    - delve for godebug: `go get -u github.com/derekparker/delve/cmd/dlv`
	- PHP Support: phpcd see https://github.com/lvht/phpcd.vim
    - auto format support by neoformat: https://github.com/sbdchd/neoformat
      - html & javascript & css & json `npm -g install js-beautify`
      - shell `go get -u mvdan.cc/sh/cmd/shfmt`
      - markdown `npm install --global prettier`
    - link config: `ln -s /path/to/init.vim ~/.config/nvim/init.vim`

2.  Install plugins: Open vim and :PlugInstall

## The useful plugin mapping

**Tip: Only custom key mapping listed, Other plugin are using default**

- File explore & File search
  - `ctrl + e` nerdtree: file explore
  - `ctrl + p` ctrlp: quick search file
  - `ctrl + r` nerdtree & ctrlp: refresh
  - `ctrl + t` nerdtree & ctrlp: open in tab
  - `ctrl + v` nerdtree & ctrlp: Open V split
  - `ctrl + x` nerdtree & ctrlp: Open X split \* `<leader>nf` nerdtree force file
- Git
  - `<leader>gs` vim-fugitive: `git status`
  - `<leader>gd` vim-fugitive: `git diff`
  - `<leader>gc` vim-fugitive: `git commit`
  - `<leader>gw` vim-fugitive: `git add` \* `<leader>gl` vim-fugitive: `git log`
- LanguageClient
  - `<leader>lc` show context menu
  - `<leader>gd` jump to define
  - `<leader>gb` jump back
  - `<leader>e` rename
- Go
  - `<leader>r` vim-go: `go run`
  - `<leader>b` vim-go: `go build`
  - `<leader>t` vim-go: `go test`
  - `<leader>c` vim-go: go-coverage
  - `<leader>e` vim-go: go-rename
  - `<leader>f` vim-go: go-referrers
  - `<leader>i` vim-go: go-implements
  - `gd` vim-go: `:GoDef`
  - `gb` vim-go: `:GoDefPop`
  - `<leader>dx` vim-go: `go-def-split`
  - `<leader>dv` vim-go: `go-def-vertical`
  - `<leader>dt` vim-go: `go-def-tab`
  - `<leader>dp` vim-godebug: `:GoToggleBreakpoint`
  - `<leader>db` vim-godebug: `:GoDebug`
- PHP
  - `gd` phpcd: jump to define
  - `gb` phpcd: jump back
  - `<leader>dx` phpcd: jump to define split
  - `<leader>dv` phpcd: jump to define vsplit
- Tagbar for tags list
  - Toggle: `<leader>tb`
- tcomment for comment
  - comment: `//`
- vim-fugitive for git
  - `<leader>gs` git status
  - `<leader>gd` git diff
  - `<leader>gw` git write
  - `<leader>gc` git commit
  - `<leader>gp` git push
  - `<leader>gb` git blame
  - `<leader>gl` git log
- Dash for show document
  - `<leader>d` dash search

## Tips

- leader is `,`
- `ctrl + t` new tab
- `shift + h` gT
- `shift + l` gt
- `ctrl + k` = `ctrl + w + (up)`
- `ctrl + j` = `ctrl + w + (down)`
- `ctrl + l` = `ctrl + w + (right)`
- `ctrl + h` = `ctrl + w + (left)`
- **tab** is 4 width tab, no space
- **clipboard** on macOS is shared with system
- `[e` move line up
- `]e` move line down
- `Ack:` for global search
- using :Gist for manage github gist
