" Vim configuration file

" Plug: {{{
  " Install vim-plug if it is not installed
  if empty(glob('~/.config/nvim/autoload/plug.vim'))
    execute '!curl --create-dirs -fLo ~/.config/nvim/autoload/plug.vim
          \ https://raw.github.com/junegunn/vim-plug/master/plug.vim'
    PlugInstall
  endif

  call plug#begin('~/.config/nvim/plugged')

  " Load plugins and their configuration
  runtime  dist/plug.vim
  runtime! dist/plugins/*.conf.vim

  call plug#end()
" }}} Plug

" Distribution: {{{
  runtime dist/variables.vim
  runtime dist/commands.vim
  runtime dist/mappings.vim
  runtime dist/theme.vim
" }}} Distribution

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif
