augroup indent_autocmds
  autocmd!
  autocmd BufNewFile BufRead *.py
    \ set tabstop=4
    \ set shiftwidth=4
    \ set colorcolumn=80
augroup END

