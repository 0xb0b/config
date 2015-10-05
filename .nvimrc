call plug#begin('~/.nvim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'

call plug#end()


" colorize

    syntax on 
    set background=dark

"    colorscheme solarized
 
    colorscheme gruvbox
    let g:gruvbox_italic=0  " turn off italic in terminal
