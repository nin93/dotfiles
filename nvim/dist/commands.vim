" Commands: {{{
  " Reload on the fly
  command! Reload source $HOME/.config/nvim/init.vim

  " Edit config file
  command! Config edit $HOME/.config/nvim/init.vim

  " Create ctags
  command! MakeTags !ctags -R .

  " Remove trailing whitespaces
  fun! _TrimWhiteSpaces()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
  endfun

  command! -nargs=0 -bar TrimWhiteSpaces call _TrimWhiteSpaces()

  " Save function
  fun! _Update()
    if &modified
      if empty(bufname('%'))
        browse confirm write
      else
        write
      endif
    endif
  endfun

  command! -nargs=0 -bar Update call _Update()

  cnoreabbrev E edit!
  cnoreabbrev Q quitall!
" }}} Commands

