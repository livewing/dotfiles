set number
set cursorline
set title
set display=lastline
set pumheight=10
set scrolloff=3
set updatetime=300

" Show invisible characters
set list
set listchars=tab:^\ ,trail:-

" Highlight parentheses
set showmatch
set matchtime=1

" Color
set background=dark
colorscheme molokai
highlight MatchParen ctermfg=208 ctermbg=233
highlight SpellCap ctermbg=3
highlight link CocHintSign Comment
highlight GitGutterAdd ctermfg=46 ctermbg=235
highlight GitGutterChange ctermfg=208 ctermbg=235
highlight GitGutterDelete ctermfg=196 ctermbg=235
