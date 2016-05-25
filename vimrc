" General {{{
set nocompatible
filetype off

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

" Clipboard
set clipboard=unnamed

" Quick move line
nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>

" Syntax
syntax on
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
set t_Co=256
set background=dark

set number
" set showmatch
" Disable it cause it's lags
let loaded_matchparen = 1

set laststatus=2

set splitbelow
set splitright

set mousehide
" set mouse=a

set cursorline
hi CursorLine cterm=NONE ctermbg=236 ctermfg=NONE gui=NONE guibg=#2d2d2d guifg=NONE

set ttyfast
set lazyredraw

set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

set winminheight=0

set virtualedit=onemore

set noerrorbells
set novisualbell
set t_vb=

set completeopt=

set nofoldenable
"}}}

" Auto commands {{{
au BufRead,BufNewFile {*.md,*.mkd,*.markdown}    set ft=markdown
au BufRead,BufNewFile {*.go}                     set ft=go
au BufRead,BufNewFile {*.json}                   set ft=json

au FileType c,cpp,java,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> call StripTrailingWhitespace()

autocmd VimEnter * call InitVimProject()
" }}}

" Key map {{{
nnoremap Y y$

cmap w!! w !sudo tee % >/dev/null

map <C-t> :tabnew<CR>

map <S-H> gT
map <S-L> gt

map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

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

function! InitVimProject()
	let initFile = "./viminit.sh"
	if filereadable(initFile)
		silent exec '!sh ' . initFile
		redraw!
	endif
endfunction
" }}}

" Plugins {{{
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle
Plugin 'gmarik/Vundle.vim'

" Other plugins
Plugin 'Lokaltog/vim-easymotion'

Plugin 'majutsushi/tagbar'
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

Plugin 'scrooloose/nerdtree'
nmap <silent> <C-e> :NERDTreeToggle<CR>
let NERDTreeMapRefreshRoot='<F5>'
let NERDTreeMapOpenInTab='<C-t>'
let NERDTreeMapOpenVSplit='<C-v>'
let NERDTreeMapOpenSplit='<C-x>'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

Plugin 'tComment'
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

Plugin 'kien/ctrlp.vim'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

Plugin 'Shougo/neocomplete.vim'
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php setlocal omnifunc=phpcomplete#Complete
if !exists('g:neocomplete#sources#omni#input_patterns')
	let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.go = '\h\w*\.\?'
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

Plugin 'kristijanhusak/vim-multiple-cursors'
" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

Plugin 'tomasr/molokai'

Plugin 'tpope/vim-fugitive'
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>:GitGutter<CR>
nnoremap <silent> <leader>gg :GitGutterToggle<CR>

Plugin 'leshill/vim-json'

Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1

Plugin 'airblade/vim-gitgutter'

Plugin 'scrooloose/syntastic'
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"

Plugin 'rking/ag.vim'

Plugin 'bling/vim-airline'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_left_sep          = '▶'
let g:airline_left_alt_sep      = '»'
let g:airline_right_sep         = '◀'
let g:airline_right_alt_sep     = '«'
let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
let g:airline#extensions#readonly#symbol   = '⊘'
let g:airline#extensions#linecolumn#prefix = '¶'
let g:airline#extensions#paste#symbol      = 'ρ'

Plugin 'gcmt/wildfire.vim'

Plugin 'fatih/vim-go'
set re=1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_def_mapping_enabled = 0
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>gd <Plug>(go-doc-browser)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap gd :GoDef<CR>
au FileType go nmap gb :GoDefPop<CR>
au FileType go nmap <Leader>dx <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

Plugin 'haya14busa/incsearch.vim'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
let g:gist_show_privates = 1
let g:gist_post_private = 1

call vundle#end()

filetype plugin indent on

color molokai
" }}}
