
" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'altercation/vim-colors-solarized'
" Plug 'morhetz/gruvbox'
call plug#end()


" vim-colors-solarized
let g:solarized_termcolors=256  " terminal
set background=light
colorscheme solarized

" gruvbox
" let g:gruvbox_italic=0  " turn off italic in terminal
" let g:gruvbox_contrast_dark="soft"
" colorscheme gruvbox
