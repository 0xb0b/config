let mapleader=" "

" list the buffers and be ready to switch
"nnoremap <leader>b :ls<CR>:b<Space>

" quick windows control
" navigation
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-h> <C-w>h
nnoremap <A-l> <C-w>l
inoremap <A-j> <Esc><C-w>j
inoremap <A-k> <Esc><C-w>k
inoremap <A-h> <Esc><C-w>h
inoremap <A-l> <Esc><C-w>l
" close window
nnoremap <A-c> <C-w>c
inoremap <A-c> <Esc><C-w>c

" terminal mode
nnoremap <A-t> :terminal<CR>
" with this mapping it is not possible to use Esc with fzf
"tnoremap <Esc> <C-\><C-n>
"    add mapping to send <Esc> key to the process in terminal?
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-l> <C-\><C-n><C-w>l
tnoremap <A-c> <C-\><C-n><C-w>c

" quick nohighlight
nnoremap <silent> <leader>/ :nohl<CR>

" quick quit
nnoremap Q :qa<cr>

" remap useful commands away from the numbers row
nnoremap <leader>e $
vnoremap <leader>e $

nnoremap <leader>m %
vnoremap <leader>m %

" fzf
nnoremap <leader><Space> :execute 'FZF --multi --cycle '.get(g:, 'env_proj_root', expand("%:p:h"))<cr>
nnoremap <C-Space> :execute 'FZF --multi --cycle '.expand("%:p:h")<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>; :Lines<cr>
nnoremap <leader>l :BLines<cr>

