" General {{{
set nocompatible

scriptencoding utf-8

set autowrite
set autoread
set autochdir
set hidden

" Backup
set nobackup
set directory=/tmp//

" Match and search
set hlsearch
set ignorecase
set smartcase
set incsearch

" clipboard
set clipboard=unnamed

" Syntax and filetype detect
syntax on
filetype plugin indent on
"}}}

" Formatting {{{
set fo+=o
set fo-=r
set fo-=t

set backspace=indent,eol,start

set smarttab
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

set pastetoggle=<F10>

set autoindent
set cindent
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do,for,switch,case
"}}}

" Visual {{{
set background=dark

set number
set showmatch

set laststatus=2

"set foldenable
"set foldmethod=marker
"set foldlevel=100
"set foldopen=block,hor,mark,percent,quickfix,tag

set splitbelow
set splitright

set mousehide
" set mouse=a

set cursorline

highlight clear SignColumn

set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

set winminheight=0

set virtualedit=onemore

set noerrorbells
set novisualbell
set t_vb=

set completeopt=

"}}}

" Auto commands {{{
au BufRead,BufNewFile {*.md,*.mkd,*.markdown}    set ft=markdown
au BufRead,BufNewFile {*.go}                     set ft=go
au BufRead,BufNewFile {*.json}                   set ft=json

au FileType c,cpp,java,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> call StripTrailingWhitespace()
au FileType go autocmd BufWritePre <buffer> Fmt

" Auto save Foldings
"au BufWinLeave * silent! mkview
"au BufWinEnter * silent! loadview
"}}}

" Key map {{{
nnoremap Y y$

cmap w!! w !sudo tee % >/dev/null

map <C-t> :tabnew<CR>

map <S-H> gT
map <S-L> gt

let mapleader = ","
" }}}

" Function {{{

function! StripTrailingWhitespace()
	" Preparation: save last search, and cursor position.
	let _s=@/
	let l = line(".")
	let c = col(".")
	" do the business:
	%s/\s\+$//e
	" clean up: restore previous search history, and cursor position
	let @/=_s
	call cursor(l, c)
endfunction

"}}}

" Plugins {{{
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle
Bundle 'gmarik/vundle'

" Other plugins
Bundle 'Lokaltog/vim-easymotion'

Bundle 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

Bundle 'scrooloose/nerdtree'
nmap <silent> <C-e> :NERDTreeToggle<CR>
let NERDTreeMapRefreshRoot='<F5>'
let NERDTreeMapOpenInTab='<C-t>'
let NERDTreeMapOpenVSplit='<C-v>'
let NERDTreeMapOpenSplit='<C-x>'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

Bundle 'tComment'
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

Bundle 'kien/ctrlp.vim'

Bundle 'jnwhiteh/vim-golang'

Bundle 'Shougo/neocomplcache'
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_prefetch = 1
let g:neocomplcache_min_syntax_length = 3
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php setlocal omnifunc=phpcomplete#Complete
if !exists('g:neocomplcache_omni_patterns')
	let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.go = '\h\w*\.\?'

Bundle 'nsf/gocode', {'rtp': 'vim/'}

Bundle 'Lokaltog/vim-powerline'
" let g:Powerline_symbols = 'fancy'

Bundle 'terryma/vim-multiple-cursors'

Bundle 'myusuf3/numbers.vim'

Bundle 'altercation/vim-colors-solarized'
let g:solarized_termcolors=256
colorscheme solarized

Bundle 'tpope/vim-fugitive'
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>:GitGutter<CR>
nnoremap <silent> <leader>gg :GitGutterToggle<CR>

Bundle 'leshill/vim-json'

Bundle 'plasticboy/vim-markdown'

Bundle 'airblade/vim-gitgutter'

Bundle 'scrooloose/syntastic'
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']

Bundle 'vim-scripts/EasyGrep'

Bundle 'sjl/gundo.vim'
nnoremap <F7> :GundoToggle<CR>

Bundle 'godlygeek/tabular'

"}}}
