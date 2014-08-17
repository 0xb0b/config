set nocompatible
filetype off

"-----------------------------
" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let vundle manage vundle
Bundle 'gmarik/vundle'
"-----------------------------

filetype plugin indent on

syntax on
" set background=dark
" colorscheme solarized
colorscheme wombat256

" start maximized
set lines=48 columns=120

" turn on line numbers
set number

" highlight cursor line
set cursorline

" set line spacing
set linespace=3

set textwidth=80
set colorcolumn=+1
" set indentation
set shiftwidth=4
set tabstop=4
" tab as spaces
set expandtab
set softtabstop=4
" round indent to multiple of shiftwidth
set shiftround
set autoindent

" display current cursor position in the lower left corner ?
" set ruler

if has("gui_running")
    " gvim
    set guifont=Ubuntu\ Mono\ 10
    " turn off GUI elements
    set guioptions-=T  " toolbar
    set guioptions-=m  " menu
    set guioptions-=e  " tabs
    set guioptions-=r  " right scrollbar
else
    " terminal
    " configure cursor to differ in insert/other mode
    if &term =~ '^xterm'
        let &t_SI .= "\<Esc>[3 q"
        let &t_EI .= "\<Esc>[2 q"
        " 1 or 0 -> blinking block
        " 2 -> solid block
        " 3 -> blinking underscore
        " 4 -> solid underscore
        " Recent versions of xterm (282 or above) also support
        " 5 -> blinking vertical bar
        " 6 -> solid vertical bar
    endif
    " set timeout on key codes to remove delay on entering normal mode (msec)
    set ttimeoutlen=10
endif


