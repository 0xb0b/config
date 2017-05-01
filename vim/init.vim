
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
set list listchars=tab:>>,trail:.

" highlight the first characters past right margin
augroup right_margin
  autocmd BufEnter * highlight RightMargin ctermbg=darkred guibg=darkred
  autocmd BufEnter * match RightMargin '\%81v.'
augroup END

source $HOME/.config/nvim/plugins.vimrc
