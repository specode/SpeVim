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

" Auto commands {{{
" au BufRead,BufNewFile {*.md,*.mkd,*.markdown} set ft=markdown
" au FileType html,javascript,css,vue.html.javascript.css set shiftwidth=2
" au FileType html,javascript,css,vue.html.javascript.css set tabstop=2
" au FileType html,javascript,css,vue.html.javascript.css,php set expandtab

au FileType c,cpp,java,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> call StripTrailingWhitespace()
" }}}

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

" }}}

" Plugins {{{
call plug#begin('~/.local/share/nvim/plugged')

Plug 'Lokaltog/vim-easymotion'

Plug 'majutsushi/tagbar' | Plug 'vim-php/tagbar-phpctags.vim'
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

Plug 'Valloric/YouCompleteMe', { 'do': './install.py' } | Plug 'shawncplus/phpcomplete.vim'
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_seed_identifiers_with_syntax = 1
au FileType css           setlocal omnifunc=csscomplete#CompleteCSS
au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
au FileType javascript    setlocal omnifunc=javascriptcomplete#CompleteJS
au FileType python        setlocal omnifunc=pythoncomplete#Complete
au FileType xml           setlocal omnifunc=xmlcomplete#CompleteTags
au FileType php           setlocal omnifunc=phpcomplete#CompletePHP
let g:phpcomplete_mappings = {
			\ 'jump_to_def': 'gd',
			\ }

Plug 'soramugi/auto-ctags.vim'
let g:auto_ctags_tags_args = '-R  --recurse --sort=yes --output-format=e-ctags'
let g:auto_ctags_tags_name = '.tags'
set tags+=./.tags

Plug 'kristijanhusak/vim-multiple-cursors'

Plug 'tomtom/tcomment_vim'
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

Plug 'ctrlpvim/ctrlp.vim' | Plug 'FelikZ/ctrlp-py-matcher'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_extensions = ['buffertag']
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_clear_cache_on_exit = 0
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
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>:GitGutter<CR>
nnoremap <silent> <leader>gg :GitGutterToggle<CR>

Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1

Plug 'airblade/vim-gitgutter'

Plug 'vim-syntastic/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_highlighting=1
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
let g:syntastic_go_checkers = ['golint', 'errcheck']
let g:syntastic_html_checkers=['tidy', 'jshint']
highlight SyntasticErrorSign guifg=white guibg=black
let g:syntastic_loc_list_height = 5
function! ToggleErrors()
	let old_last_winnr = winnr('$')
	lclose
	if old_last_winnr == winnr('$')
		" Nothing was closed, open syntastic error location panel
		Errors
	endif
endfunction
nnoremap <Leader>s :call ToggleErrors()<cr>
nnoremap <Leader>sn :lnext<cr>
nnoremap <Leader>sp :lprevious<cr>

Plug 'rking/ag.vim'

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

Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' } | Plug 'jodosha/vim-godebug'
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
au FileType go nmap <Leader>e <Plug>(go-rename)
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

Plug 'Chiel92/vim-autoformat'
au BufWrite * :Autoformat

Plug 'plasticboy/vim-markdown' | Plug 'godlygeek/tabular'
let g:vim_markdown_no_default_key_mappings = 1

" color
Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'

call plug#end()

color solarized
" color molokai

" set background=light
set background=dark
" }}}
