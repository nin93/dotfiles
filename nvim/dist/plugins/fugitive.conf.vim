" Fugitive
function! FugitiveProject() abort
  let repo = fnamemodify(FugitiveWorkTree(), ':t')
  if empty(repo)
    return ''
  endif
  return repo . g:git_branch_indicator . FugitiveHead()
endfunction
