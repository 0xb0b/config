
" auto-install vim-plug
let plug_path = nvim_config_dir.'/autoload/plug.vim'
let plugged_path = nvim_config_dir.'/plugged'

if empty(glob(plug_path))
  execute '!curl -fLo '.plug_path.' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(plugged_path)
Plug 'morhetz/gruvbox'
Plug 'yuttie/comfortable-motion.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
call plug#end()


" colors:
set termguicolors
set background=dark
colorscheme gruvbox
let g:gruvbox_italic=0  " turn off italic in terminal
let g:gruvbox_contrast_dark="soft"

" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1

" fzf
let g:fzf_layout = {'down': '~30%'}
let g:fzf_action = {'ctrl-s': 'split', 'ctrl-v': 'vsplit'}

