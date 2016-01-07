## About

This is my personally use vim config.

My main work on Go, PHP, You can fork this repositorie and modify it until you like.

## Quick Start

1. Install plugins dependencies:
    * Vundle for manager plugins: `git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle`
    * Gotags for tagbar: `go get -u github.com/jstemmer/gotags` or `brew install gotags`(For Mac OS X)
    * Ag for code search: see https://github.com/ggreer/the_silver_searcher

2. Install plugins: Open vim and :PluginInstall

3. Using it.

## Tips

* leader is ","
* ctrl + t : new tab
* shift + h : gT
* shift + l : gt
* ctrl + k : ctrl + w + (up)
* ctrl + j : ctrl + w + (down)
* ctrl + l : ctrl + w + (right)
* ctrl + h : ctrl + w + (left)
* tab is 4 width tab, no space
* clipboard on Mac OS X is shared with system
* paste toggle is F10
* when you forget for edit file with root, you can try w!! save file


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
* vim-hybrid
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
