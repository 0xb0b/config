
" auto-install vim-plug
let plug_path = nvim_config_dir.'/autoload/plug.vim'
let plugged_path = nvim_config_dir.'/plugged'

if empty(glob(plug_path))
  execute '!curl -fLo '.plug_path.' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(plugged_path)
"Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
"Plug 'reedes/vim-colors-pencil'
Plug 'yuttie/comfortable-motion.vim'
"Plug 'junegunn/goyo.vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
call plug#end()


set termguicolors
" vim-colors-solarized
"let g:solarized_termcolors=256  " terminal
set background=dark
"colorscheme solarized
"colorscheme pencil

" gruvbox
let g:gruvbox_italic=0  " turn off italic in terminal
"let g:gruvbox_contrast_dark="soft"
colorscheme gruvbox
