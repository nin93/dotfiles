" Fyzzy Finder
let g:fzf_tags_command = 'ctags -R'

let g:fzf_layout = {
      \ 'up':'~90%', 'window': {
      \     'width': 0.7, 'height': 0.7,'yoffset':0.5,
      \     'xoffset': 0.5, 'border': 'sharp'
      \   }
      \ }

nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-b> :Buffers<CR>
