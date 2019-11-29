let mapleader=" "

" list the buffers and be ready to switch
"nnoremap <leader>b :ls<CR>:b<Space>

" quick windows control
" navigation
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-h> <C-w>h
nnoremap <M-l> <C-w>l
inoremap <M-j> <Esc><C-w>j
inoremap <M-k> <Esc><C-w>k
inoremap <M-h> <Esc><C-w>h
inoremap <M-l> <Esc><C-w>l
" close window
nnoremap <M-c> <C-w>c
inoremap <M-c> <Esc><C-w>c
" close buffer without closing the split
" (wipeout - remove buffer from jumplist also)
" stackoverflow.com/a/33952557/3001041
" close location window if it exists | switch to #(alternate) buffer | wipeout alternate
" buffer (alternate buffer is now the buffer that was current before the switch)
nnoremap <silent> <M-d> :lclose<bar>b#<bar>bwipeout #<CR>

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
" open file in the project
" (fallback to the directory of the current file if the project is not defined)
nnoremap <leader>o :exe 'FZF --multi --cycle '.get(g:, 'env_proj_root', expand("%:p:h"))<CR>
" open file in the directory of the current file
nnoremap <leader>O :exe 'FZF --multi --cycle '.expand("%:p:h")<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>; :Lines<CR>
nnoremap <leader>l :BLines<CR>

" LanguageClient
nnoremap <silent> <leader>d :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <leader>r :call LanguageClient#textDocument_references({'includeDeclaration': v:false})<CR>
" TODO does not work, LanguageClient does not understand ccls response?
nnoremap <silent> <leader>S :call LanguageClient#textDocument_documentSymbol()<CR>
" TODO use plugin to make this into hierarchycal list
nnoremap <silent> <leader>c :call LanguageClient#findLocations({'method':'$ccls/call'})<CR>
"nnoremap <silent> <leader>C :call LanguageClient#findLocations({'method':'$ccls/call','callee':v:true})<CR>

