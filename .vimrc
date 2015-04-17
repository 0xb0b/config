"------------------------------------------------------------------------------
" Vundle

" Turn off vi-compatible mode. Needed for vim improvements. Set automatically
" when user .vimrc is found, so it's just to be sure.

set nocompatible

" Turn filetype off and then on after bundles block.
" vim caches filetype plugins from runtime path and path is updated by 
" Bundle commands.

filetype off

" set the runtime path to include Vundle and initialize
set rtp += ~/.vim/bundle/Vundle.vim
call vundle#begin()

" let vundle manage vundle
Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'

" All plugins must be added before this line
call vundle#end()

filetype plugin indent on
"------------------------------------------------------------------------------

syntax on
set background=dark
colorscheme solarized

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
set autoindent
set shiftwidth=4
" tab as spaces
set expandtab
set softtabstop=4
" round indent to multiple of shiftwidth
set shiftround

" incremental search + highlight found things
set incsearch
set hlsearch

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

" References
" http://yannesposito.com/Scratch/en/blog/Vim-as-IDE/
" https://robots.thoughtbot.com/the-vim-learning-curve-is-a-myth
" http://benmccormick.org/2014/06/30/learning-vim-in-2014-the-basics/
" http://tilvim.com/
" https://github.com/kien/rainbow_parentheses.vim
" https://github.com/luochen1990/rainbow
