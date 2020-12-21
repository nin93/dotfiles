" Mappings: {{{
  let mapleader = "\<space>"
  nnoremap <space> <nop>

  " Saving: {{{
    " Ctrl+S to save current buffer
    nnoremap <silent> <C-s> :Update<CR>
    inoremap <silent> <C-s> <C-o>:Update<CR>
    vnoremap <silent> <C-s> <C-o>:Update<CR>
  " }}} Saving

  " Highlight: {{{
    " Clear highlighted search
    nnoremap <silent> <leader>/ :nohlsearch<CR>
    " Find merge conflict markers
    map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>
  " }}} Highlight

  " Cursor: {{{
    " Move cursor to the beginning / end of line
    noremap <C-a> 0
    noremap <C-e> $
    " Wrapped lines goes down/up to next row, rather than next line in file.
    "noremap <silent> j gj
    "noremap <silent> k gk
  " }}} Cursor

  " Selections: {{{
    " Move selected lines Up/Down
    vnoremap J :m '>+1<CR>gv=gv
    vnoremap K :m '<-2<CR>gv=gv

    " Keep selection while indenting
    vnoremap < <gv
    vnoremap > >gv

    " Wrap selections with brackets/quotes
    " example.com => (example.com)
    vnoremap %( <Esc>`>a)<Esc>`<i(<Esc>
    vnoremap %) <Esc>`>a)<Esc>`<i(<Esc>
    " example.com => [example.com]
    vnoremap %[ <Esc>`>a]<Esc>`<i[<Esc>
    vnoremap %] <Esc>`>a]<Esc>`<i[<Esc>
    " example.com => {example.com}
    vnoremap %{ <Esc>`>a}<Esc>`<i{<Esc>
    vnoremap %} <Esc>`>a}<Esc>`<i{<Esc>
    " example.com => <example.com>
    vnoremap %< <Esc>`>a><Esc>`<i<<Esc>
    vnoremap %> <Esc>`>a><Esc>`<i<<Esc>
    " example.com => _example.com_
    vnoremap %_ <Esc>`>a_<Esc>`<i_<Esc>
    " example.com => *example.com*
    vnoremap %* <Esc>`>a*<Esc>`<i*<Esc>
    " example.com => /example.com/
    vnoremap %/ <Esc>`>a/<Esc>`<i/<Esc>
    " example.com => :example.com:
    vnoremap %: <Esc>`>a:<Esc>`<i:<Esc>
    " example.com => "example.com"
    vnoremap %" <Esc>`>a"<Esc>`<i"<Esc>
    " example.com => 'example.com'
    vnoremap %' <Esc>`>a'<Esc>`<i'<Esc>
    " example.com => `example.com`
    vnoremap %` <Esc>`>a`<Esc>`<i`<Esc>
  " }}} Selections

  " Splits: {{{
    " Resize windows
    nmap <leader>+ :vertical resize +
    nmap <leader>- :vertical resize -

    " Remap split navigation to Ctrl+(hjkl)
    nnoremap <silent> <C-h> :wincmd h<CR>
    nnoremap <silent> <C-j> :wincmd j<CR>
    nnoremap <silent> <C-k> :wincmd k<CR>
    nnoremap <silent> <C-l> :wincmd l<CR>
  " }}} Splits
" }}} Mappings
