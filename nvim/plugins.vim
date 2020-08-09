
" auto-install vim-plug
let plug_path = stdpath("config").'/autoload/plug.vim'
let plugged_path = stdpath("config").'/plugged'

if empty(glob(plug_path))
  execute '!curl -fLo '.plug_path.' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(plugged_path)
" Plug '0xb0b/isee.nvim', {'do': ':UpdateRemotePlugins'}
Plug '/home/xbob/proj/nvim/isee.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': './install.sh'}
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug '/home/xbob/proj/nvim/still_colored'
Plug 'morhetz/gruvbox'
Plug 'm-pilia/vim-ccls'
Plug 'psliwka/vim-smoothie'
Plug 'scrooloose/nerdcommenter'
" Plug 'yuttie/comfortable-motion.vim'
call plug#end()


" colors:
set termguicolors
set background=dark
colorscheme still_colored
let g:gruvbox_italic=0  " turn off italic in terminal
let g:gruvbox_contrast_dark="soft"

" fzf
let g:fzf_layout = {'down': '~30%'}
let g:fzf_action = {'ctrl-s': 'split', 'ctrl-v': 'vsplit'}

" isee
let g:isee_size = 1
let g:isee_soft_shadow_size = 4
" let g:isee_shadow_color = 0x333399

" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1

" LanguageClient
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_windowLogMessageLevel = "Warning"

