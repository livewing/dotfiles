set autoindent
set breakindent
set expandtab
set smartindent

set tabstop=4
set shiftwidth=0

augroup indent_filetype
  autocmd!
  autocmd FileType css             setlocal tabstop=2
  autocmd FileType gitconfig       setlocal noexpandtab
  autocmd FileType html            setlocal tabstop=2
  autocmd FileType javascript      setlocal tabstop=2
  autocmd FileType javascriptreact setlocal tabstop=2
  autocmd FileType json            setlocal tabstop=2
  autocmd FileType jsonc           setlocal tabstop=2
  autocmd FileType markdown        setlocal tabstop=2
  autocmd FileType ruby            setlocal tabstop=2
  autocmd FileType sass            setlocal tabstop=2
  autocmd FileType scss            setlocal tabstop=2
  autocmd FileType sh              setlocal tabstop=2
  autocmd FileType toml            setlocal tabstop=2
  autocmd FileType typescript      setlocal tabstop=2
  autocmd FileType typescriptreact setlocal tabstop=2
  autocmd FileType vim             setlocal tabstop=2
  autocmd FileType xml             setlocal tabstop=2
  autocmd FileType yaml            setlocal tabstop=2
  autocmd FileType zsh             setlocal tabstop=2
augroup END
