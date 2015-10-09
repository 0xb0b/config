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

" get the background color of the Normal highlighting group
" and make it darker
let bgcolor=synIDattr(synIDtrans(hlID("Normal")), "bg") - 1
" highlight 256 columns after textwidth
set textwidth=80
exe "highlight ColorColumn ctermbg=".bgcolor
let &colorcolumn="+".join(range(1,256), ",+")
