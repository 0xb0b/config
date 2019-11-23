" generic environment configuration

let s:nvim_config_dir = stdpath("config")
execute 'source '.globpath(s:nvim_config_dir, 'init.vim')

source $NVIM_ENVDIR/$NVIM_ENVNAME/init.vim

set sessionoptions-=blank sessionoptions+=resize sessionoptions+=winpos
augroup env_autocmds
  autocmd!
" save environment session on exit
  autocmd VimLeavePre * mksession! $NVIM_ENVDIR/$NVIM_ENVNAME/session.vim
augroup END

command! Env :echo 'env: '.$NVIM_ENVNAME.' @ '.g:env_proj_root

