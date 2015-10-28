"~/.vimrc

" functionality
set nocompatible
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')
Plugin 'VundleVim/Vundle.vim'
" Plugins that blend in
Plugin 'L9'
Plugin 'Raimondi/delimitMate'
"Plugin 'Valloric/YouCompleteMe' " if on arch, I recommend installing vim-youcompleteme-git
Plugin 'edkolev/tmuxline.vim'
Plugin 'ervandew/supertab'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'luochen1990/rainbow'
Plugin 'scrooloose/syntastic'
Plugin 'sickill/vim-pasta'
Plugin 'tmhedberg/matchit'
Plugin 'vim-airline'
" Plugins that don't blend in (require more insight as to how they work ... key bindings, etc)
Plugin 'a.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'mbbill/undotree'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/Color-Sampler-Pack'
Plugin 'vim-scripts/align'
" Color and fun :)
Plugin 'vim-scripts/TeTrIs.vim'
Plugin 'vim-scripts/xoria256.vim'
call vundle#end()
filetype plugin indent on

set history=10000
set autoread
set hidden
let mapleader=','
set scrolloff=4
set mouse=""
set virtualedit="block"

" undo (do not change order)
set noswapfile
set nobackup
set nowb
set undodir=~/.config/nvim/backup
set undofile


" tabs
set autoindent
set smartindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" search
set incsearch
set hlsearch
set ignorecase
set smartcase

" pretty
" colors
syntax on
if &term == "xterm"
    set laststatus=2
    set t_Co=256
    " airline - fancy fonts?
    let g:airline_powerline_fonts=1

    " colorscheme badwolf
    " colorscheme gruvbox
    " colorscheme jellybeans
    " colorscheme molokai
    " colorscheme monokai
    " colorscheme wombat256mod
    colorscheme xoria256
    let g:airline_theme='badwolf'
    " let g:airline_theme='bubblegum'

    " colorscheme solarized
    " let g:airline_theme='solarized'
elseif &term == 'screen-256color'
    set laststatus=2
    set t_Co=256
    colorscheme xoria256
    let g:airline_powerline_fonts=1
    " let g:airline_theme='jellybeans'
    let g:airline_theme='badwolf'
else
    set laststatus=1
    set t_Co=8
    colorscheme darkZ " get from https://raw.githubusercontent.com/isaacs/.vim/master/colors-all/darkZ.vim
    let g:airline_theme='raven'
endif
" inside window
set cursorline
set colorcolumn=91,121
set list
set listchars=eol:¬,tab:»»,extends:>,trail:·
" outside window
set relativenumber
set number
set laststatus=2
set noshowmode
set wildmenu

" let vim autoswap in tmux
" (if using autoswap ... for this turn off noswapfil, no backup, nowb)
"let g:autoswap_detect_tmux = 1

" activate rainbow parens
let g:rainbow_active = 1

" toggle background from light to dark
nmap <leader>b :let &background=(&background == "light" ? "dark" : "light")<cr>:AirlineRefresh<cr>

