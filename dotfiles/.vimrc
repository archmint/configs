" *start* {{{
if has('vim_starting')
    if &compatible
        set nocompatible    " do not maintatin compatibility with vi
    endif

    scriptencoding utf-8
    set encoding=utf-8      " encoding => utf-8 (cannot run after startup)

    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
"}}}

" *neobundle* {{{
call neobundle#begin(expand('~/.vim/bundle/')) " required
NeoBundle 'Shougo/neobundle.vim'                       " manage neobundle

" Plugins that blend in
NeoBundle 'L9'                                         " some utility functions and commands

" NeoBundle 'Raimondi/delimitMate'                       " auto-closes quotes, parems, brackets, etc

NeoBundle 'Valloric/YouCompleteMe'                     " autocompletion engines (must run python2 .../YouCompleteMe/install.py)

NeoBundle 'airblade/vim-gitgutter'                     " display git diff in gutter

" NeoBundle 'ervandew/supertab'                          " similar-word completion

NeoBundle 'gioele/vim-autoswap'                        " automatically manages swaps files
let g:autoswap_detect_tmux = 1                         " let vim autoswap in tmux (uses vim-autoswap) ** requires swap files **

" NeoBundle 'gorodinskiy/vim-coloresque'                 " see 256 colors in terminal!

NeoBundle 'luochen1990/rainbow'                        " make different parentheses layers different colors
let g:rainbow_active = 1                               " activate rainbow parens
NeoBundle 'scrooloose/syntastic'                       " awesome syntax checker

NeoBundle 'sickill/vim-pasta'                          " awesome auto-pasting

" NeoBundle 'tmhedberg/matchit'                          " extended matching with %

NeoBundle 'vim-airline'                                " awesome status bar

" NeoBundle 'vim-scripts/SearchComplete'                 " auto-completion in search (lazy :P)

" NeoBundle 'vim-signature'                              " visual marks and nice keybindings for dealing with marks


" Plugins that don't blend in (require more insight as to how they work ... key bindings, etc)
NeoBundle 'a.vim'                                      " swap between header files quickly

NeoBundle 'ctrlp.vim'                                  " fuzzy finder

" NeoBundle 'godlygeek/tabular'                          " awesome tab commands (that I never really use)

NeoBundle 'tomtom/tcomment_vim'                        " awesome commenting bindings

NeoBundle 'tpope/vim-fugitive'                         " AWESOME git wrapper

NeoBundle 'tpope/vim-surround'                         " awesome surrounding characters changer

" NeoBundle 'vim-scripts/align'                          " align something on a character (like tabular I guess)


" Colorschemes and fun :)
NeoBundle 'altercation/vim-colors-solarized'           " awesome solarized colors (make sure you have solarized palette)

" NeoBundle 'morhetz/gruvbox'                            " nice dark colorscheme

" NeoBundle 'guardian'                                   " light colorsheme

NeoBundle 'nanotech/jellybeans.vim'                    " nice very dark colorscheme

NeoBundle 'tomasr/molokai'

NeoBundle 'crusoexia/vim-monokai'                     " nice medium dark colorscheme (my fav)

" NeoBundle 'vim-scripts/TeTrIs.vim'                     " play tetris with <leader>te

NeoBundle 'vim-scripts/xoria256.vim'                   " nice dark colorscheme

" NeoBundle 'edkolev/tmuxline.vim'                       " good for generating nice tmuxline (don't import unless you are configuring tmuxline)
NeoBundleFetch 'edkolev/tmuxline.vim'                  " good for generating nice tmuxline (don't import unless you are configuring tmuxline)
call neobundle#end()                                   " required
filetype plugin indent on                              " required
NeoBundleCheck                                         " If there are uninstalled bundles found on startup,
"}}}

" *colors and visual preferences* {{{
syntax enable
set background=dark                             " dark background!
if exists("$DISPLAY") " in X11
    set t_Co=256
    " colorscheme monokai
    colorscheme solarized
    " colorscheme jellybeans
    let airline_powerline_fonts=1
    let airline_theme='tomorrow'
    " let airline_theme='badwolf'
    " let airline_theme='raven'
    " let airline_theme='jellybeans'
    " let airline_theme='molokai'
else
    set t_Co=8
    colorscheme zellner
    let airline_powerline_fonts=0
endif

"set synmaxcol=256                               " limit syntax highlighting to 256 columns (default 1000)

set cursorline                                  " horizontal line where cursor is
set colorcolumn=81,121                          " vertical lines at 81 and 121

set list                                        " show hidden characters
set listchars=eol:¬,tab:»\ ,extends:»,trail:·   " configure what to show for hidden characters

set number                                      " show line numbers
set relativenumber                              " relative line numbers from current line #

set laststatus=2                                " always show the status bar at the bottom
set noshowmode                                  " don't display --insert--, --visual--, --normal--, etc

set wildmenu                                    " show a nice menu for completiong with colon-commands

set novisualbell                                " no flashing
set noerrorbells                                " no noise
set vb t_vb=                                    " disable any beeps or flashes on error

set nosplitbelow                                " horizontal splits open above (default)
set splitright                                  " vertical splits open to the right"
" }}}

" *undo* {{{
" don't change order
"set noswapfile
"set nobackup
"set nowb
set undodir=~/.vim/undo
set undofile
"}}}

" *search* {{{
set incsearch           " hilight in real time while searching
set hlsearch            " highlight all matches
"set ignorecase          " ignores case when searching
"set smartcase           " case sensitive with a capital letter
" }}}

" *indentation* {{{
set autoindent                  " automatically indent
set cindent                     " c-style indentation
set smartindent                 " c-like indentation on new line

set shiftwidth=4                " number of spaces to auto-indent with cindent, <<, >>, etc
set softtabstop=4               " make spaces feel like tabs (i.e. <BS> deletes to last tabstop)
set tabstop=4                   " number of spaces tab inserts
set expandtab                   " use spaces rather than tabs

set indentkeys-=0#              " do not break indent on #
set cinoptions=:s,ps,ts,cs      " how cindent re-indents a line
set cinwords=if,else,while,do
set cinwords+=for,switch,case   " words that cause indent on next line
" }}}

" *general* {{{
set virtualedit=block   " doesn't constrain visual block

set history=10000       " big history (max)

set modeline            " check for modes (like vim: foldmethod=marker)
set modelines=5         " check first 5 lines (default)

set autowrite           " autowrite on make/shell commands
set autoread            " autoread when file is changed

set hidden              " current buffer can be hidden when not written to disk

" set scrolloff=4         " start scrolling when 4 lines away from top/bottom (set if you like .. I don't like it)

set mouse=""            " disable mouse (so annoying when you click or scroll)

nnoremap <space> za     " let space toggle folds

set timeoutlen=550      " time to wait after esc (default 1000 ... way too long)

set fo-=o               " don't automatically insert comment after newline on commented line
" }}}

" *leader configuration for visual preferences* {{{
" toggle background from light to dark
nnoremap <silent> <leader>bg :let &background=(&background == "light" ? "dark" : "light")<cr>:silent AirlineRefresh<cr>:<cr>

" toggle showing invisibles
nnoremap <silent> <leader>l :set list!<cr>

" toggle relative numbers
nnoremap <silent> <leader>r :set relativenumber!<cr>:<cr>

" list buffers and pre-type ':buffer ' for you
nnoremap <leader>bf :buffers<cr>:buffer<space>

" fun colorschemes
nnoremap <silent> <leader>[l :echo "backgrounds: gruvbox (g), jellybeans (j), monokai (m), solarized (s), xoria256 (x)"<cr>
nnoremap <silent> <leader>[g :set background=dark<cr>:colorscheme gruvbox<cr>:AirlineRefresh<cr>
nnoremap <silent> <leader>[j :set background=dark<cr>:colorscheme jellybeans<cr>:AirlineRefresh<cr>
nnoremap <silent> <leader>[m :set background=dark<cr>:colorscheme monokai<cr>:AirlineRefresh<cr>
nnoremap <silent> <leader>[s :set background=dark<cr>:colorscheme solarized<cr>::AirlineTheme badwolf<cr>:AirlineRefresh<cr>
nnoremap <silent> <leader>[x :set background=dark<cr>:colorscheme xoria256<cr>:AirlineRefresh<cr>
" }}}

" *disable arrow keys* {{{
" *DO THIS IF YOU ARE NEW*
" *I have noticed a few glitches, though*
" noremap <Up> <NOP>
" noremap <Down> <NOP>
" noremap <Left> <NOP>
" noremap <Right> <NOP>
" inoremap <Up> <NOP>
" inoremap <Down> <NOP>
" inoremap <Left> <NOP>
" inoremap <Right> <NOP>
"}}}

" vim: foldmethod=marker
