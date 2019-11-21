
" turn on syntax highlighting (this also triggers <filetype on>)
syntax on

" hybrid line numbers
" current line - absolute number, other lines - relative
set number
set relativenumber

" do not make swapfiles
set noswapfile

" default indentation
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
" insert spaces instead of tabs
set expandtab
" make textwidth margin
"let &colorcolumn=join(range(80, 200), ',')
set colorcolumn=101

" make tabs and trailing spaces visible
set list listchars=tab:▸▸,trail:·

" Unix line endings only
set fileformat=unix

" automatically write the buffer when leaving
set autowriteall

" more natural splitting
set splitbelow
set splitright

" detect file type, load filetype plugin, use filetype indent
filetype plugin indent on

" grep
if executable("rg")
    set grepprg=rg\ --vimgrep\ --hidden
endif

augroup vimrc_autocmds
  autocmd!
" highlight the first characters past right margin
" autocmd BufEnter * highlight RightMargin ctermbg=DarkRed ctermfg=White guibg=DarkRed guifg=White
" autocmd BufEnter * match RightMargin '\%81v.'

" toggle cursor line highlight in INSERT mode
"  autocmd InsertEnter * set cursorline
"  autocmd InsertLeave * set nocursorline

" change to directory of the current buffer
  " autocmd BufEnter * cd %:p:h

" open quickfix window on grep
  autocmd QuickFixCmdPost grep cwindow
augroup END

" Python 3 support
let g:python3_host_prog = $ENVDIR.'/python/neovim/bin/python'

" config directory variable
let g:nvim_config_dir = stdpath("config")

execute 'source '.globpath(nvim_config_dir, 'mappings.vim')
execute 'source '.globpath(nvim_config_dir, 'plugins.vim')

