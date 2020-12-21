" Lightline
let g:lightline = { 'colorscheme': 'nord' }
let g:lightline.separator = { 'left': '', 'right': '' }
let g:lightline.subseparator = { 'left': '', 'right': '' }

let g:git_branch_indicator             = ' @'
let g:lightline#ale#indicator_checking = '…'
let g:lightline#ale#indicator_infos    = 'I'
let g:lightline#ale#indicator_warnings = 'W'
let g:lightline#ale#indicator_errors   = 'E'
let g:lightline#ale#indicator_ok       = 'OK'

let g:lightline.component_expand = {
      \   'linter_checking': 'lightline#ale#checking',
      \   'linter_infos': 'lightline#ale#infos',
      \   'linter_warnings': 'lightline#ale#warnings',
      \   'linter_errors': 'lightline#ale#errors',
      \   'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_function = {
      \   'gitbranch': 'FugitiveHead',
      \   'gitrepo': 'FugitiveProject',
      \ }

let g:lightline.component_type = {
      \   'linter_checking': 'right',
      \   'linter_infos': 'right',
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_ok': 'right',
      \ }

let g:lightline.active = {
      \   'right': [
      \     [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok', 'lineinfo' ],
      \     [ 'percent' ],
      \     [ 'fileformat', 'filetype' ]
      \   ],
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'gitrepo', 'readonly', 'filename', 'modified' ]
      \   ]
      \ }
