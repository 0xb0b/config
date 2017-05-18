
" auto-install vim-plug
if has("win32")
  let plug_path = nvim_config_dir.'\autoload\plug.vim'
  let plugged_path = nvim_config_dir.'\plugged'
else
  let plug_path = nvim_config_dir.'/autoload/plug.vim'
  let plugged_path = nvim_config_dir.'/plugged'
endif

let vim_plug_uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
if empty(glob(plug_path))
  if has("win32")
    silent execute '!md '.nvim_config_dir.'\autoload'
    " windows, install manually!
  else
    silent execute '!curl -fLo '.plug_path.' --create-dirs '.vim_plug_uri
  endif
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(plugged_path)
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
call plug#end()


" vim-colors-solarized
let g:solarized_termcolors=256  " terminal
set background=light
colorscheme solarized

" gruvbox
" let g:gruvbox_italic=0  " turn off italic in terminal
" let g:gruvbox_contrast_dark="soft"
" colorscheme gruvbox
