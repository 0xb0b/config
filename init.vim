call plug#begin('~/.config/nvim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'

call plug#end()


" colorize

    syntax on 
"    set background=dark
    set background=light

    colorscheme solarized
 
"    let g:gruvbox_italic=0  " turn off italic in terminal
"    let g:gruvbox_contrast_dark="soft"
"    colorscheme gruvbox


" hybrid line numbers
    
    set number
    set relativenumber


" indentation
    set autoindent
    set smartindent
    set shiftwidth=2
    set softtabstop=2
    set expandtab


" change background after textwidth column
" get the background color of the Normal highlighting group
" and make it darker
let bgcolor=synIDattr(synIDtrans(hlID("Normal")), "bg") - 1
" highlight 256 columns after textwidth
set textwidth=80
exe "highlight ColorColumn ctermbg=".bgcolor
let &colorcolumn="+".join(range(1,256), ",+")


" mappings
nmap <CR> o<Esc>k
nmap <S-Enter> O<Esc>j
