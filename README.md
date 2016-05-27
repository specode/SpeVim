## About

This is my personally use vim config.

My main work on Go, PHP, You can fork this repositorie and modify it until you like.

## Quick Start

1. Install plugins dependencies:
    * Vundle for manager plugins: `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
    * Gotags for tagbar: `go get -u github.com/jstemmer/gotags` or `brew install gotags`(For Mac OS X)
    * Ag for code search: see https://github.com/ggreer/the_silver_searcher

2. Install plugins: Open vim and :PluginInstall

3. Using it.

## The useful plugin mapping

**Tip: Only custom key mapping listed, Other plugin are using default**

* File explore & File search
	* `ctrl + e` nerdtree: file explore
	* `ctrl + p` ctrlp: quick search file
	* `F5` nerdtree & ctrlp: refresh
	* `ctrl + t` nerdtree & ctrlp: open in tab
	* `ctrl + v` nerdtree & ctrlp: Open V split
	* `ctrl + x` nerdtree & ctrlp: Open X split
* Tarbar
	* `F8` Toggle tarbar
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
* **clipboard** on Mac OS X is shared with system
* **paste toggle** is `F10`
* **sudo save file:** when you forget for edit file with root, you can try w!! save file
* `[e`  move line up
* `]e` move line down
* **project init script:** execute "./viminit.sh" when startup vim, you can using for init project, like set golang $GOPATH

Plugin Lists:
-------------

* Vundle
* easymotion
* tagbar
* nerdtree
* tComment
* ctrlp
* neocomplete
* vim-multiple-cursors
* molokai
* vim-fugitive
* vim-json
* vim-markdown
* vim-gitgutter
* syntastic
* ag.vim
* vim-airline
* wildfire.vim
* vim-go
* incsearch.vim
* gist-vim
