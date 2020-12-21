" NERDTree
map <C-n> :NERDTreeToggle<CR>

let g:NERDTreeShowHidden = 1
let g:NERDTreeNaturaSort = 1
let g:NERDTreeQuitOnOpen = 1

let g:NERDTreeMapUpdir            = 'h'
let g:NERDTreeMapActivateNode     = 'l'
let g:NERDTreeDirArrowExpandable  = ''
let g:NERDTreeDirArrowCollapsible = ''

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif
