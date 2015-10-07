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


" hybrid line numbers
    
    set number
    set relativenumber

" change background after textwidth column

highlight ColorColumn ctermbg=16
let &colorcolumn="+".join(range(1,256), ",+")
