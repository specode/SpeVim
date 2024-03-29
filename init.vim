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

" Update time
set updatetime=300

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
autocmd FileType dart set tabstop=2 | set shiftwidth=2 | set expandtab
autocmd FileType proto set tabstop=2 | set shiftwidth=2 | set expandtab
" }}}

" Plugins {{{
call plug#begin('~/.local/share/nvim/plugged')

" Code complete {{{
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

nmap <silent> gd :call CocActionAsync('jumpDefinition')<CR>
nmap <silent> <leader>dt :call CocActionAsync('jumpDefinition', 'tabe')<CR>
nmap <silent> <leader>dv :call CocActionAsync('jumpDefinition', 'vsplit')<CR>
nmap <silent> <leader>dx :call CocActionAsync('jumpDefinition', 'split')<CR>
nmap <silent> gb <C-O>
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader> rn <Plug>(coc-rename)

autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.formatDocument')

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
" }}}

" plist
Plug 'darfink/vim-plist'

" Vue
Plug 'posva/vim-vue'
autocmd BufRead,BufNewFile {*.vue,*.wpy} setlocal filetype=vue.html.javascript.css
autocmd FileType vue syntax sync fromstart
let g:vue_disable_pre_processors=1

" Markdown
Plug 'plasticboy/vim-markdown' | Plug 'godlygeek/tabular'
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_no_default_key_mappings = 1

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" Javascript
Plug 'pangloss/vim-javascript'

" TOML
Plug 'cespare/vim-toml'

" Dart
Plug 'dart-lang/dart-vim-plugin'
" }}}

" Base Tools {{{
Plug 'Lokaltog/vim-easymotion'

Plug 'scrooloose/nerdtree'
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
	let g:ackprg = 'ag --vimgrep -a --ignore ''.git'' --ignore ''.svn'' --ignore ''.DS_Store'' --ignore ''node_modules'' --ignore ''*log*'' '
endif

Plug 'ctrlpvim/ctrlp.vim'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_lazy_update = 50
let g:ctrlp_max_files = 0
let g:ctrlp_custom_ignore = {
			\ 'dir':  '\v[\/]\.(git|hg|svn)$',
			\ 'file': '\v\.(exe|so|dll)$',
			\ 'link': 'some_bad_symbolic_links',
			\ }

Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
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
" }}}

" Program tools {{{
Plug 'tomtom/tcomment_vim'
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

Plug 'gcmt/wildfire.vim'

Plug 'github/copilot.vim'

" VCS {{{
Plug 'airblade/vim-gitgutter'

Plug 'junegunn/gv.vim'
nnoremap <silent> <leader>gl :GV<CR>
" }}}

" }}}

" Other {{{

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
