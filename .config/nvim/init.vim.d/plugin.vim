let s:dein_dir = stdpath('cache') . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let s:dein_toml = stdpath('config') . '/dein.toml'

" Clone dein.vim
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim.git ' . shellescape(s:dein_repo_dir))
endif

" Load dein.vim
let &runtimepath = &runtimepath . ',' . s:dein_repo_dir
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:dein_toml)
  call dein#end()
  call dein#save_state()
endif
filetype plugin indent on
syntax enable

" Install new plugins
if has('vim_starting') && dein#check_install()
  call dein#install()
endif

" Uninstall removed plugins
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif
