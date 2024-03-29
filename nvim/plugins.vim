
" auto-install vim-plug
let plug_path = stdpath("config").'/autoload/plug.vim'
let plugged_path = stdpath("config").'/plugged'

if empty(glob(plug_path))
  execute '!curl -fLo '.plug_path.' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(plugged_path)
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': './install.sh'}
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'm-pilia/vim-ccls'
" Plug 'yuttie/comfortable-motion.vim'
Plug 'psliwka/vim-smoothie'
Plug 'scrooloose/nerdcommenter'
Plug '0xb0b/isee.nvim', {'do': ':UpdateRemotePlugins', 'branch': 'async_highlight_screen_rows'}
" Plug '/home/xbob/proj/nvim/isee.nvim', {'do': ':UpdateRemotePlugins'}
Plug '0xb0b/still_colored', {'branch': 'light_scheme_from_yt'}
" Plug '/home/xbob/proj/nvim/still_colored'
call plug#end()


" colors:
set termguicolors
" set background=dark
set background=light
colorscheme still_colored

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

