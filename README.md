## About

This is my personally use neovim config.

My main work on Go, PHP, You can fork this repositorie and modify it until you like.

_The config only test on macOS + iTerm2 + neovim._

## Quick Start (macOS)

1.  Install plugins dependencies:

    - neovim python support: `pip2 install neovim` && `pip3 install neovim`
    - vim-plug: see https://github.com/junegunn/vim-plug
    - Ag for code search and speed up ctrlp: `brew install the_silver_searcher`
    - upgrade ctags for tagbar: `brew install ctags`
    - coc for code complete:
      - config document: https://github.com/neoclide/coc.nvim/wiki/Language-servers#register-custom-language-servers
    - auto format support by neoformat: https://github.com/sbdchd/neoformat
      - html & javascript & css & json `npm -g install js-beautify`
      - shell `go get -u mvdan.cc/sh/cmd/shfmt`
      - markdown `npm install --global prettier`
    - link config: `ln -s /path/to/init.vim ~/.config/nvim/init.vim`

2.  Install plugins: Open vim and :PlugInstall

## The useful plugin mapping

**Tip: Only custom key mapping listed, Other plugin are using default**

- coc LSP support
  - `gd` jump to definition
  - `gb` jump back
  - `<leader>dt` jump to definition new tab
  - `<leader>dv` jump to definition vsplit
  - `<leader>dx` jump to definition split
- File explore & File search
  - `ctrl + e` nerdtree: file explore
  - `ctrl + p` ctrlp: quick search file
  - `ctrl + r` nerdtree & ctrlp: refresh
  - `ctrl + t` nerdtree & ctrlp: open in tab
  - `ctrl + v` nerdtree & ctrlp: open V split
  - `ctrl + x` nerdtree & ctrlp: open X split
  - `<leader>nf` nerdtree force file
- Git
  - `<leader>gs` vim-fugitive: `git status`
  - `<leader>gd` vim-fugitive: `git diff`
  - `<leader>gc` vim-fugitive: `git commit`
  - `<leader>gw` vim-fugitive: `git add`
  - `<leader>gl` vim-fugitive: `git log`
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
