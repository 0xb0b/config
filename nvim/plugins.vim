
" auto-install vim-plug
let plug_path = nvim_config_dir.'/autoload/plug.vim'
let plugged_path = nvim_config_dir.'/plugged'

if empty(glob(plug_path))
  execute '!curl -fLo '.plug_path.' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(plugged_path)
" Plug '0xb0b/imfocus.nvim', {'do': ':UpdateRemotePlugins'}
Plug '/home/xbob/proj/nvim/imfocus.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': './install.sh'}
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'm-pilia/vim-ccls'
Plug 'scrooloose/nerdcommenter'
Plug 'yuttie/comfortable-motion.vim'
call plug#end()


" colors:
set termguicolors
set background=dark
colorscheme gruvbox
let g:gruvbox_italic=0  " turn off italic in terminal
let g:gruvbox_contrast_dark="soft"

" fzf
let g:fzf_layout = {'down': '~30%'}
let g:fzf_action = {'ctrl-s': 'split', 'ctrl-v': 'vsplit'}

" imfocus
let g:imfocus_size = 1
let g:imfocus_soft_shadow_size = 4

" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1

" LanguageClient
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_windowLogMessageLevel = "Warning"

