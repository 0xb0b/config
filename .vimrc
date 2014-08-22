set nocompatible
filetype off

"-----------------------------
" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let vundle manage vundle
Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
"-----------------------------

filetype plugin indent on

syntax on
" set background=dark
" colorscheme solarized
colorscheme wombat256

set lines=48 columns=120

" turn on line numbers
set number

" highlight cursor line
"set cursorline

set linespace=3

" disable auto wrap
set textwidth=0

" highlight space after allowed columns range (temporary)
"let &colorcolumn=join(range(81,335), ",")
" let basecolor=synIDattr(hlID('Normal'), 'bg#')
"autocmd ColorScheme * highlight ColorColumn ctermbg=232 guibg=#2c2d27
autocmd ColorScheme * call matchadd('ColorColumn', '\%81v', 100)
set nocursorline " performance issue

" set indentation
set shiftwidth=4
set tabstop=4
" tab as spaces
set expandtab
set softtabstop=4
" round indent to multiple of shiftwidth
set shiftround
set autoindent

" display current cursor position in the lower left corner?
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
        " use red cursor
        let &t_SI = "\<Esc>]12;red\x7"
        let &t_EI = "\<Esc>]12;red\x7"
        silent !echo -ne "\033]12;red\007"
        " reset cursor when vim exits
        " use \003]12;gray\007 for gnome-terminal
        autocmd VimLeave * silent !echo -ne "\033]112\007"
        let &t_SI .= "\<Esc>[5 q"
        let &t_EI .= "\<Esc>[1 q"
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


