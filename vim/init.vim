
"turn on syntax highlighting
syntax on

" hybrid line numbers - current line - absolute number, other lines - relative
set number
set relativenumber

" do not make swapfiles
set noswapfile

" indentation
set autoindent
set smartindent
" insert spaces instead of tabs
set shiftwidth=2
set tabstop=2
set expandtab

" make tabs and trailing spaces visible
set list listchars=tab:▸▸,trail:·

" Unix line endings always
set ff=unix

" automatically write the buffer when leaving
set autowriteall

Guifont Consolas:h10

augroup vimrc_autocmds
  autocmd!
" highlight the first characters past right margin
  autocmd BufEnter * highlight RightMargin ctermbg=darkred guibg=darkred
  autocmd BufEnter * match RightMargin '\%81v.'
" toggle cursor line highlight in INSERT mode
  autocmd InsertEnter * set cursorline
  autocmd InsertLeave * set nocursorline
" change to directory of the current buffer
  autocmd BufEnter * cd %:p:h
augroup END

" config directory variable
let g:nvim_config_dir = fnamemodify($MYVIMRC, ':p:h')

" mappings
execute 'source '.globpath(nvim_config_dir, 'mappings.vimrc')

" plugins stuff
execute 'source '.globpath(nvim_config_dir, 'plugins.vimrc')

