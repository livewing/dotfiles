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
