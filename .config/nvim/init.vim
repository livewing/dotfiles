if &compatible
  set nocompatible
endif

" Install dein.vim
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif

" Load dein.vim
let &runtimepath = &runtimepath . ',' . s:dein_repo_dir
let s:toml_file = fnamemodify(expand('<sfile>'), ':h') . '/dein.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml_file)
  call dein#end()
  call dein#save_state()
endif
filetype plugin indent on
syntax enable

" Install plugins
if has('vim_starting') && dein#check_install()
  call dein#install()
endif

" Encoding
set fenc=utf-8

" Color & View
set number
set cursorline
set title
set display=lastline
set showmatch
set matchtime=1
set pumheight=10
set scrolloff=3
set background=dark
colorscheme molokai
highlight MatchParen ctermfg=208 ctermbg=233
highlight SpellCap ctermbg=3

" Tab & Space
set expandtab
set smartindent
set list
set listchars=tab:^\ ,trail:-
set tabstop=4
set shiftwidth=4

autocmd FileType css        setlocal tabstop=2 shiftwidth=2
autocmd FileType html       setlocal tabstop=2 shiftwidth=2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2
autocmd FileType json       setlocal tabstop=2 shiftwidth=2
autocmd FileType ruby       setlocal tabstop=2 shiftwidth=2
autocmd FileType sh         setlocal tabstop=2 shiftwidth=2
autocmd FileType toml       setlocal tabstop=2 shiftwidth=2
autocmd FileType vim        setlocal tabstop=2 shiftwidth=2
autocmd FileType xml        setlocal tabstop=2 shiftwidth=2
autocmd FileType zsh        setlocal tabstop=2 shiftwidth=2

" Search & Replace
set hlsearch
set incsearch
set inccommand=nosplit
set ignorecase
set smartcase
set wrapscan

" Clipboard
set clipboard+=unnamed

" Mouse
set mouse=a

" Key mapping
inoremap <C-c> <Esc>
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
nnoremap Y y$
nnoremap j gj
nnoremap k gk
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
vnoremap j gj
vnoremap k gk

" Cursor position
augroup RestoreCursorPosition
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
augroup END

" Disable new line comment
augroup DisableNewLineComment
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END
