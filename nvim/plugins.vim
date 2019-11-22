
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
Plug 'mhinz/vim-startify'
call plug#end()


" colors:
set termguicolors
set background=dark
colorscheme gruvbox
let g:gruvbox_italic=0  " turn off italic in terminal
let g:gruvbox_contrast_dark="soft"


" startify
let g:startify_lists = [ {'type': 'sessions', 'header': ['  session']},
                        \{'type': 'files', 'header': ['  recent']} ]
let g:startify_files_number = 16
let g:startify_session_sort = 1
let g:startify_session_persistence = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_dir = 0
let g:startify_padding_left = 4
let g:startify_enable_special = 0
let g:startify_custom_indices = ['j', 'f', 'k', 'd', 'h', 'g']
let g:startify_custom_header = ['']

" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1

" fzf
let g:fzf_layout = {'down': '~30%'}
let g:fzf_action = {'ctrl-s': 'split', 'ctrl-v': 'vsplit'}

