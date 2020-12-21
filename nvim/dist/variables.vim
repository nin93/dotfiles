" Appearence: {{{
  set confirm           " Enable confirm dialogs when needed

  " Colorscheme
  set background=dark " Set background color
  syntax enable

  " TTY
  set ttyfast           " Faster redrawing
  set shell=$SHELL      " Set default shell
  set title             " Set terminal title

  " Column side
  set number            " Enable number of rows
  set relativenumber    " Display relative number in line
  set signcolumn=yes    " Always disply signcolumn

  " Row side
  " Try to detect FileType and gain informations about autoindenting
  filetype indent plugin on
  set autoindent        " Automatically set indent of new line
  set nowrap              " Turn off line wrapping
  "set wrapmargin=8      " Wrap lines when coming within n characters from side
  set linebreak         " Set soft wrapping
  set list              " Enable invisible characters
  set listchars=tab:\|\ ,eol:¬,trail:⋅,extends:…,precedes:…

  " Command Line
  set showcmd           " Show partial commands in the last line of win
  set laststatus=2      " Always disply status bar
  set shortmess=F       " Hide messages from status bar
  set noshowmode        " Hide mode echoing in ststus bar
  set wildmenu          " Enable displaying of matched files in tab completion

  " Cursor
  set cursorline        " Highlight the line the cursor holds on
  set scrolloff=30      " Keep cursor in the middle of screen when possible
  " set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  "       \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  "       \,sm:block-blinkwait175-blinkoff150-blinkon175

  " Buffers
  set autoread          " Detect changesi in files
  set hidden            " Allow moving through buffers
  set noswapfile        " Disable '.swp' files
  set splitbelow        " Enable any-directional splits
  set splitright        " Enable any-directional splits

  " Tab control
  set expandtab         " Expand tab to spaces
  set smarttab          " Make tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
  set tabstop=2         " The visible width of tabs
  set softtabstop=2     " Edit as if the tabs are 4 characters wide
  set shiftwidth=2      " Number of spaces to use for indent and unindent
  set shiftround        " Round indent to a multiple of 'shiftwidth'

  " Fold control
  set foldmethod=marker " Enable folding by indentations
  set foldnestmax=10    " Max value within indents are folded
  set foldlevel=5       " Set the initial fold scope limit
  set nofoldenable      " Ensure new opened files are unfolded

  " Searching
  set ignorecase        " Case insensitive searching
  set smartcase         " Case-sensitive if expresson contains a capital letter
  set hlsearch          " Highlight search results
  set incsearch         " Set incremental search, like modern browsers

  " Update control
  set nolazyredraw      " Don't redraw while executing macros
  set updatetime=200    " Set the global update rate

  " Whether Vim should use Nerd Fonts characters or not
  let g:shell_nerd_fonts_enabled = 0

  if has("termguicolors")
    set termguicolors
  endif

  if has('mouse')
    set mouse=a
  endif
" }}} Appearence
