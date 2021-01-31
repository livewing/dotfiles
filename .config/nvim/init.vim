runtime init.vim.d/plugin.vim
runtime init.vim.d/encoding.vim
runtime init.vim.d/display.vim
runtime init.vim.d/indent.vim
runtime init.vim.d/search.vim
runtime init.vim.d/integration.vim
runtime init.vim.d/keymap.vim
runtime init.vim.d/misc.vim

if filereadable(expand('$HOME/.vimrc.local'))
  source $HOME/.vimrc.local
endif
