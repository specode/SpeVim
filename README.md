## About

This is my personally use neovim config.

My main work on Go, PHP, You can fork this repositorie and modify it until you like.

*The config only test on macOS + iTerm2 + neovim.*

## Quick Start (macOS)

1. Install plugins dependencies:
    * vim-plug: see https://github.com/junegunn/vim-plug
    * Ag for code search and speed up ctrlp: `brew install the_silver_searcher`
	* upgrade ctags for tagbar: `brew install ctags`, set PATH `export PATH="$(brew --prefix ctags)/bin:$PATH"`
    * phpctags for tagbar: `brew install phpctags`, set PATH `export PATH="$(brew --prefix phpctags)/bin:$PATH"`
    * gotags for tagbar: `brew install gotags`
	* delve for godebug: `brew install go-delve/delve/delve`

2. Install plugins: Open vim and :PlugInstall

## Plugin List

* vim-plug
* vim-easymotion
* tagbar
* tagbar-phpctags.vim
* nerdtree
* YouCompleteMe
* vim-multiple-cursors
* tComment
* ctrlp.vim
* ctrlp-py-matcher
* vim-fugitive
* vim-markdown
* syntastic
* ag.vim
* vim-airline
* vim-airline-themes
* wildfire.vim
* vim-go
* gist-vim
* webapi-vim
* dash.vim
* vim-godebug

## The useful plugin mapping

**Tip: Only custom key mapping listed, Other plugin are using default**

* File explore & File search
	* `ctrl + e` nerdtree: file explore
	* `ctrl + p` ctrlp: quick search file
	* `ctrl + r` nerdtree & ctrlp: refresh
	* `ctrl + t` nerdtree & ctrlp: open in tab
	* `ctrl + v` nerdtree & ctrlp: Open V split
	* `ctrl + x` nerdtree & ctrlp: Open X split
* Git
	* `<leader>gs` vim-fugitive: `git status`
	* `<leader>gd` vim-fugitive: `git diff`
	* `<leader>gc` vim-fugitive: `git commit`
	* `<leader>gw` vim-fugitive: `git add`
	* `<leader>gl` vim-fugitive: `git log`
* Go
	* `<leader>r` vim-go: `go run`
	* `<leader>b` vim-go: `go build`
	* `<leader>t` vim-go: `go test`
	* `<leader>c` vim-go: go-coverage
	* `<leader>gd` vim-go: `godoc`
	* `gd` vim-go: `:GoDef`
	* `gb` vim-go: `:GoDefPop`
	* `<leader>dx` vim-go: `go-def-split`
	* `<leader>dv` vim-go: `go-def-vertical`
	* `<leader>dt` vim-go: `go-def-tab`
	* `<leader>dp` vim-godebug: `:GoToggleBreakpoint`
	* `<leader>db` vim-godebug: `:GoDebug`
* Tagbar
	* Toggle: `<leader>tb`

## Tips

* leader is `,`
* `ctrl + t` new tab
* `shift + h` gT
* `shift + l` gt
* `ctrl + k` = `ctrl + w + (up)`
* `ctrl + j` = `ctrl + w + (down)`
* `ctrl + l` = `ctrl + w + (right)`
* `ctrl + h` = `ctrl + w + (left)`
* **tab** is 4 width tab, no space
* **clipboard** on macOS is shared with system
* **sudo save file:** when you forget for edit file with root, you can try w!! save file
* `[e` move line up
* `]e` move line down
