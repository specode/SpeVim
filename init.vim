" General {{{
set nocompatible

scriptencoding utf-8
set fileencodings=utf-8
set termencoding=utf-8
set encoding=utf-8

set autowrite
set autoread
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

" Auto reload
au FocusGained * :checktime

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

set autoindent
set cindent
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do,for,switch,case
"}}}

" Key map {{{
nnoremap Y y$

map <C-t> :tabnew<CR>

map <S-H> gT
map <S-L> gt

if has('nvim')
	" Hack to get C-h working in neovim
	nmap <BS> <C-W>h
	tnoremap <Esc> <C-\><C-n>
endif
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

let mapleader = ","
" }}}

" Autocmd {{{
autocmd FileType php set tabstop=4 | set shiftwidth=4 | set expandtab
" }}}

" Plugins {{{
call plug#begin('~/.local/share/nvim/plugged')

" Code complete {{{
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" Go
Plug 'zchee/deoplete-go', { 'do': 'make'}
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#unimported_packages = 1

" PHP
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']
" }}}

" Language support {{{
" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_def_reuse_buffer = 1
let g:go_def_mapping_enabled = 0
let g:go_fmt_autosave = 0
let g:go_mod_fmt_autosave = 0
let g:go_updatetime = 500
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <Leader>f <Plug>(go-referrers)
au FileType go nmap <Leader>i <Plug>(go-implements)
au FileType go nmap gd :GoDef<CR>
au FileType go nmap gb :GoDefPop<CR>
au FileType go nmap <Leader>dx <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>dp :GoToggleBreakpoint<CR>
au FileType go nmap <Leader>db :GoDebug<CR>

" plist
Plug 'darfink/vim-plist'

" Vue
Plug 'posva/vim-vue'
autocmd BufRead,BufNewFile {*.vue,*.wpy} setlocal filetype=vue.html.javascript.css

" Markdown
Plug 'plasticboy/vim-markdown' | Plug 'godlygeek/tabular'
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_no_default_key_mappings = 1

" Javascript
Plug 'pangloss/vim-javascript'

" TOML
Plug 'cespare/vim-toml'
" }}}

" Base Tools {{{
Plug 'Lokaltog/vim-easymotion'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
nmap <silent> <C-e> :NERDTreeToggle<CR>
let NERDTreeMapRefreshRoot='<C-r>'
let NERDTreeMapOpenInTab='<C-t>'
let NERDTreeMapOpenVSplit='<C-v>'
let NERDTreeMapOpenSplit='<C-x>'
au BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nmap <leader>nf :NERDTreeFind<CR>

Plug 'kristijanhusak/vim-multiple-cursors'

Plug 'mileszs/ack.vim'
if executable('ag')
	let g:ackprg = 'ag --vimgrep --ignore ''.git'' --ignore ''.svn'' --ignore ''.DS_Store'' --ignore ''node_modules'' --ignore ''*log*'' '
endif

Plug 'ctrlpvim/ctrlp.vim' | Plug 'FelikZ/ctrlp-py-matcher'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_extensions = ['buffertag']
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_lazy_update = 50
let g:ctrlp_max_files = 0
let g:ctrlp_custom_ignore = {
			\ 'dir':  '\v[\/]\.(git|hg|svn)$',
			\ 'file': '\v\.(exe|so|dll)$',
			\ 'link': 'some_bad_symbolic_links',
			\ }
if executable("ag")
	set grepprg=ag\ --nogroup\ --nocolor
	let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.svn'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
endif

Plug 'bling/vim-airline' | Plug 'vim-airline/vim-airline-themes'
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

Plug 'flazz/vim-colorschemes'

Plug 'wsdjeg/FlyGrep.vim'
nnoremap <leader>s :FlyGrep<cr>
" }}}

" Program tools {{{
Plug 'majutsushi/tagbar'
nnoremap <leader>tb :TagbarToggle<CR>

Plug 'tomtom/tcomment_vim'
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

Plug 'sbdchd/neoformat'
let g:neoformat_try_formatprg = 1
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 0
let g:neoformat_basic_format_trim = 1
let g:neoformat_enabled_go = ['goimports', 'gofmt']
augroup fmt
	autocmd!
	autocmd BufWritePre * silent! undojoin | Neoformat
augroup END

Plug 'w0rp/ale'

Plug 'gcmt/wildfire.vim'

" VCS {{{
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-fugitive'
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>:GitGutter<CR>

Plug 'junegunn/gv.vim'
nnoremap <silent> <leader>gl :GV<CR>
" }}}

" }}}

" Other {{{
Plug 'mattn/gist-vim' | Plug 'mattn/webapi-vim'
let g:gist_show_privates = 1
let g:gist_post_private = 1

Plug 'rizzatti/dash.vim'
nmap <silent> <leader>d <Plug>DashSearch
" }}}

call plug#end()
" }}}

" Visual {{{
set t_Co=256

set number

set laststatus=2

set splitbelow
set splitright

set mousehide

set cursorline

set winminheight=0

set virtualedit=onemore

set noerrorbells
set vb t_vb=
if has("autocmd") && has("gui")
	au GUIEnter * set t_vb=
endif

set completeopt=

set nofoldenable

set incsearch

set background=light
" set background=dark
colorscheme solarized
"}}}
