let mapleader = "\<Space>"

nnoremap Y y$
nnoremap j gj
nnoremap k gk
nnoremap <silent><C-n> :bnext<CR>
nnoremap <silent><C-p> :bprev<CR>
nnoremap <silent><C-h> <C-w>h
nnoremap <silent><C-j> <C-w>j
nnoremap <silent><C-k> <C-w>k
nnoremap <silent><C-l> <C-w>l
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent><Leader>a :CocAction<CR>
nnoremap <silent><Leader>b :Buffers<CR>
nnoremap <silent><Leader>f :FZF<CR>
nnoremap <silent><Leader>F :FZF ~<CR>
nnoremap <silent><Leader>ga :Gwrite<CR>
nnoremap <silent><Leader>gb :Gblame<CR>
nnoremap <silent><Leader>gc :Gcommit<CR>
nnoremap <silent><Leader>gd :Gdiff<CR>
nnoremap <silent><Leader>ge :GFiles?<CR>
nnoremap <silent><Leader>gf :GFiles<CR>
nnoremap <silent><Leader>gg :GitGutterToggle<CR>
nnoremap         <Leader>gi :Git<Space>
nnoremap <silent><Leader>gs :Gstatus<CR>
nnoremap <silent><Leader>r :QuickRun<CR>
nnoremap <silent><Leader>s :Startify<CR>
nnoremap Q <Nop>
nnoremap ZQ <Nop>
nnoremap ZZ <Nop>

imap <C-c> <Esc>
inoremap <silent><expr><CR> pumvisible() ? "<C-y>" : "\<C-g>u\<CR>\<C-r>=coc#on_enter()\<CR>"

inoremap <silent><expr><C-Space> coc#refresh()
inoremap <silent><expr><Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

vnoremap j gj
vnoremap k gk


set completeopt=menuone,noinsert,noselect

function! s:show_documentation()
  if (index(['vim', 'help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . ' ' . expand('<cword>')
  endif
endfunction
