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

" Visual {{{
set t_Co=256
set background=dark

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

" autocmd {{{
autocmd FileType php set tabstop=4 | set shiftwidth=4 | set expandtab
" }}}

" Plugins {{{
call plug#begin('~/.local/share/nvim/plugged')

Plug 'Lokaltog/vim-easymotion'

Plug 'majutsushi/tagbar'
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
nnoremap <leader>tb :TagbarToggle<CR>

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
nmap <silent> <C-e> :NERDTreeToggle<CR>
let NERDTreeMapRefreshRoot='<C-r>'
let NERDTreeMapOpenInTab='<C-t>'
let NERDTreeMapOpenVSplit='<C-v>'
let NERDTreeMapOpenSplit='<C-x>'
au BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nmap <leader>nf :NERDTreeFind<CR>

Plug 'Valloric/YouCompleteMe', { 'do': './install.py --js-completer --java-completer' }
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_seed_identifiers_with_syntax = 1
au FileType css           setlocal omnifunc=csscomplete#CompleteCSS
au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
au FileType javascript    setlocal omnifunc=javascriptcomplete#CompleteJS
au FileType python        setlocal omnifunc=pythoncomplete#Complete
au FileType xml           setlocal omnifunc=xmlcomplete#CompleteTags
au FileType java nnoremap gd :YcmCompleter GoTo<CR>
au FileType java nnoremap gb <C-o>

Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
au FileType php nmap gd :call phpcd#JumpToDefinition('normal')<CR>
au FileType php nmap gb :call phpcd#JumpBack()<CR>
au FileType php nmap <Leader>dx :call phpcd#JumpToDefinition('split')<CR>
au FileType php nmap <Leader>dv :call phpcd#JumpToDefinition('vsplit')<CR>

Plug 'kristijanhusak/vim-multiple-cursors'

Plug 'tomtom/tcomment_vim'
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

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

Plug 'tpope/vim-fugitive'
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>:GitGutter<CR>

Plug 'junegunn/gv.vim'
nnoremap <silent> <leader>gl :GV<CR>

Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1

Plug 'airblade/vim-gitgutter'

Plug 'w0rp/ale'

Plug 'mileszs/ack.vim'
if executable('ag')
	let g:ackprg = 'ag --vimgrep --ignore ''.git'' --ignore ''.svn'' --ignore ''.DS_Store'' --ignore ''node_modules'' --ignore ''*log*'' '
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

Plug 'gcmt/wildfire.vim'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_def_mapping_enabled = 0
let g:go_def_reuse_buffer = 1
let g:go_auto_type_info = 1
let g:go_fmt_command = "goimports"
set updatetime=50
" TODO: maybe bug
let g:go_gocode_propose_source = 0
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

Plug 'mattn/gist-vim' | Plug 'mattn/webapi-vim'
let g:gist_show_privates = 1
let g:gist_post_private = 1

Plug 'rizzatti/dash.vim'
nmap <silent> <leader>d <Plug>DashSearch

Plug 'darfink/vim-plist'

Plug 'posva/vim-vue'
autocmd BufRead,BufNewFile {*.vue,*.wpy} setlocal filetype=vue.html.javascript.css

Plug 'sbdchd/neoformat'
let g:neoformat_try_formatprg = 1
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 0
let g:neoformat_basic_format_trim = 1
let g:neoformat_enabled_go = []
augroup fmt
	autocmd!
	autocmd BufWritePre * silent! undojoin | Neoformat
augroup END

Plug 'plasticboy/vim-markdown' | Plug 'godlygeek/tabular'
let g:vim_markdown_no_default_key_mappings = 1

Plug 'pangloss/vim-javascript'

Plug 'cespare/vim-toml'

Plug 'flazz/vim-colorschemes'

Plug 'wsdjeg/FlyGrep.vim'
nnoremap <leader>s :FlyGrep<cr>

call plug#end()

" colorscheme blackboard
colorscheme solarized

" set background=light
set background=dark
" }}}
