" CoC
let g:coc_global_extensions = ['coc-snippets']

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" " Use tab to enable completion
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <silent><expr> <S-TAB>
"       \ pumvisible() ? "\<C-p>" :
"       \ "\<C-h>"

" Use CR to select completion
inoremap <silent><expr> <Tab>
      \ pumvisible() ? coc#_select_confirm() :
      \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
