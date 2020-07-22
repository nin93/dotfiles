" .vimrc Vim configuration file

" Vundle: {{{
filetype off

set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'AlessandroYorba/Sierra'
Plugin 'w0ng/vim-hybrid'
Plugin 'VundleVim/Vundle.vim'
Plugin 'mhinz/vim-signify'
Plugin 'dense-analysis/ale'
Plugin 'maximbaz/lightline-ale'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-commentary'
Plugin 'nin93/vim-crystal'
Plugin 'jiangmiao/auto-pairs'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-fugitive'
Plugin 'ycm-core/YouCompleteMe'

call vundle#end()
" }}} Vundle

" Environment: {{{
set shell=zsh
set updatetime=100
set wildmenu              " Enables displaying of matched files in tab completion
set path+=**              " Extends the path to current tree recursively
set nu rnu                " Enables number of rows
set showcmd               " Show partial commands in the last line of win
set confirm               " Enable confirm dialogs when needed
set scrolloff=20          " Keeps cursor in the middle of screen when possible
set shortmess=F           " Hides messages from status bar
set noshowmode            " Hides mode echoing in ststus bar
set hidden                " Allows moving through buffers
set laststatus=2          " Always disply status bar
set autoindent            " Enables autoindentation
set ts=2 sts=2 sw=2       " Overrides tabs
set noswapfile            " Disable .swp files
set splitbelow splitright
set foldmethod=syntax     " Enables folding by indentations
set foldnestmax=10        " Max value within indents are folded
set foldlevel=5           " Sets the initial fold scope limit
set background=dark
" set nofoldenable          " Ensures new opened files are unfolded

if has("termguicolors")
	set termguicolors
endif

" Try to detect FileType and gain informations about autoindenting
filetype indent plugin on

" Whether Vim should use Nerd Fonts characters or not
let g:shell_nerd_fonts_enabled = 0
" }}} Environment

" Colorscheme: {{{
syntax enable
let g:hybrid_reduced_contrast = 0
colorscheme hybrid

" hi Normal guibg=NONE ctermbg=NONE
" }}} Colorscheme

" Commands: {{{
command! MakeTags !ctags -R .

command! -nargs=0 -bar Update if &modified
	\|		if empty(bufname('%'))
	\|			browse confirm write
	\|		else
	\|			write
	\|		endif
	\|	endif

command! Config          :execute ":edit $HOME/.vimrc"
command! ConfigAlacritty :execute ":edit $HOME/.config/alacritty/alacritty.yml"
command! ConfigBspwm     :execute ":edit $HOME/.config/bspwm/bspwmrc"
command! ConfigCava      :execute ":edit $HOME/.config/cava/config"
command! ConfigCompton   :execute ":edit $HOME/.config/compton.conf"
command! ConfigI3wm      :execute ":edit $HOME/.config/i3/config"
command! ConfigNcmpcpp   :execute ":edit $HOME/.config/ncmpcpp/config"
command! ConfigNVim      :execute ":edit $HOME/.config/nvim/init.vim"
command! ConfigPolybar   :execute ":edit $HOME/.config/polybar/config"
command! ConfigRofi      :execute ":edit $HOME/.config/rofi/config"
command! ConfigSxhkd     :execute ":edit $HOME/.config/sxhkd/sxhkdrc"
command! ConfigXinit     :execute ":edit $HOME/.xinitrc"
command! ConfigXdef      :execute ":edit $HOME/.Xdefaults"
command! ConfigXres      :execute ":edit $HOME/.Xresources"
command! ConfigZsh       :execute ":edit $HOME/.zshrc"
command! ConfigZshEnv    :execute ":edit $HOME/.zshenv"

command! Reload          :execute ":source $HOME/.vimrc"
command! ReloadNVim      :execute ":source $HOME/.config/nvim/init.vim"
command! ReloadZsh       :execute ":! source $HOME/.zshrc"

command! WriteAsSU :execute ":silent w !sudo tee % > /dev/null" | :edit!
cnoreabbrev W WriteAsSU
" }}} Commands

" Mappings: {{{
let mapleader = " "

" Exiting Insert mode conveniently
inoremap ii <Esc>
vnoremap ii <Esc>

" Ctrl+S to save current buffer
nnoremap <silent> <C-s> :<C-u>Update<CR>
inoremap <silent> <C-s> <C-o>:Update<CR>
vnoremap <silent> <C-s> <C-o>:Update<CR>

" Folds: {{{
nnoremap <Leader>f za 
" }}} Folds

" Snippets: {{{
inoremap <buffer> ;; <C-O>/%%%<CR><C-O>c3l
nnoremap <buffer> ;; /%%%<CR>c3l
" }}} Snippets

" Cursor: {{{
nnoremap <silent> H 0
nnoremap <silent> J <PageDown>
nnoremap <silent> K <PageUp>
nnoremap <silent> L $
" }}} Cursor

" Buffers: {{{
inoremap <C-e> :edit 
nnoremap <C-e> :edit 
nnoremap <C-t>- :bdelete<CR>
nnoremap <F2> :bprev<CR>
nnoremap <F3> :bnext<CR>
" }}} Buffers 

" Selections: {{{
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" }}} Selections 

" Splits: {{{
nmap <silent> <Leader>+ :exe "vertical resize +1"<CR>
nmap <silent> <Leader>- :exe "vertical resize -1"<CR>

" Remap split navigation to Ctrl+(hjkl)
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>
" }}} Splits

" Reload config file
nnoremap <F5> :source $HOME/.vimrc<CR>
" }}} Mappings

" Plugins: {{{

function! FugitiveProject() abort
	let repo = fnamemodify(FugitiveWorkTree(), ':t')
	if empty(repo)
		return ''
	endif
	return repo . g:git_branch_indicator . FugitiveHead()
endfunction

" Signify: {{{
let g:signify_vcs_cmds = {
      \ 'git':      'git diff --no-color --no-ext-diff -U0 -- %f',
      \ 'yadm':     'yadm diff --no-color --no-ext-diff -U0 -- %f',
      \ 'hg':       'hg diff --color=never --config aliases.diff= --nodates -U0 -- %f',
      \ 'svn':      'svn diff --diff-cmd %d -x -U0 -- %f',
      \ 'bzr':      'bzr diff --using %d --diff-options=-U0 -- %f',
      \ 'darcs':    'darcs diff --no-pause-for-gui --no-unified --diff-opts=-U0 -- %f',
      \ 'fossil':   'fossil diff --unified -c 0 -- %f',
      \ 'cvs':      'cvs diff -U0 -- %f',
      \ 'rcs':      'rcsdiff -U0 %f 2>%n',
      \ 'accurev':  'accurev diff %f -- -U0',
      \ 'perforce': 'p4 info '. sy#util#shell_redirect('%n') . (has('win32') ? ' &&' : ' && env P4DIFF= P4COLORS=') .' p4 diff -du0 %f',
      \ 'tfs':      'tf diff -version:W -noprompt -format:Unified %f'
      \ }

let g:signify_vcs_cmds_diffmode = {
			\ 'git':      'git show HEAD:./%f',
			\ 'yadm':     'yadm show HEAD:./%f',
			\ 'hg':       'hg cat %f',
			\ 'svn':      'svn cat %f',
			\ 'bzr':      'bzr cat %f',
			\ 'darcs':    'darcs show contents -- %f',
			\ 'fossil':   'fossil cat %f',
			\ 'cvs':      'cvs up -p -- %f 2>%n',
			\ 'rcs':      'co -q -p %f',
			\ 'accurev':  'accurev cat %f',
			\ 'perforce': 'p4 print %f',
			\ 'tfs':      'tf view -version:W -noprompt %f',
			\ }

let g:signify_line_highlight = 0

let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'
let g:signify_sign_show_count = 1
let g:signify_sign_show_text = 1
let g:signify_difftool = 'gnudiff'
" }}} Signify

" ALE: {{{
if g:shell_nerd_fonts_enabled
	let g:ale_sign_error   = ""
	let g:ale_sign_warning = ""
"	let g:ale_sign_error   = ""
"	let g:ale_sign_warning = ""
else
	let g:ale_sign_error   = '»'
	let g:ale_sign_warning = '»'
endif
" }}} ALE
 
" Crystal: {{{
let g:crystal_auto_format = 0
" }}} Crystal

" Lightline: {{{
let g:lightline = { 'colorscheme': 'one' }

if g:shell_nerd_fonts_enabled
else
endif

if g:shell_nerd_fonts_enabled
	let g:git_branch_indicator              = '  '
	let g:lightline#ale#indicator_checking  = ' '
	let g:lightline#ale#indicator_infos     = ' '
	let g:lightline#ale#indicator_warnings  = ' '
	let g:lightline#ale#indicator_errors    = ' '
	let g:lightline#ale#indicator_ok        = ' '
else
	let g:git_branch_indicator              = '@'
	let g:lightline#ale#indicator_checking  = '…'
	let g:lightline#ale#indicator_infos     = 'I'
	let g:lightline#ale#indicator_warnings  = 'W'
	let g:lightline#ale#indicator_errors    = 'E'
	let g:lightline#ale#indicator_ok        = 'OK'
endif

let g:lightline.component_expand = {
	\		'linter_checking': 'lightline#ale#checking',
	\		'linter_infos': 'lightline#ale#infos',
	\		'linter_warnings': 'lightline#ale#warnings',
	\		'linter_errors': 'lightline#ale#errors',
	\		'linter_ok': 'lightline#ale#ok',
	\ }

let g:lightline.component_function = {
	\   'gitbranch': 'FugitiveHead',
	\		'gitrepo': 'FugitiveProject',
	\ }

let g:lightline.component_type = {
	\		'linter_checking': 'right',
	\		'linter_infos': 'right',
	\		'linter_warnings': 'warning',
	\		'linter_errors': 'error',
	\		'linter_ok': 'right',
	\ }

let g:lightline.active = {
	\		'right': [
	\			[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok', 'lineinfo' ],
	\			[ 'percent' ],
	\			[ 'fileformat', 'filetype' ]
	\		],
	\   'left': [
	\			[ 'mode', 'paste' ],
	\			[ 'gitrepo', 'readonly', 'filename', 'modified' ]
	\		]
	\	}
" }}} Lightline
" }}} Plugins
