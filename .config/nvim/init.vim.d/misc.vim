set autoread
set hidden

set swapfile
set directory=$HOME/.local/share/nvim/swap//
if !isdirectory(&directory)
  call mkdir(&directory, 'p')
endif

set backup
set backupdir=$HOME/.local/share/nvim/backup//
if !isdirectory(&backupdir)
  call mkdir(&backupdir, 'p')
endif

set undofile
set undodir=$HOME/.local/share/nvim/undo//
if !isdirectory(&undodir)
  call mkdir(&undodir, 'p')
endif

let g:netrw_home=stdpath('data')

" Save cursor position
augroup save_cursor_position
  autocmd!
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
augroup END
