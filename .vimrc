"~/.vimrc

" =============== Vundle Initialization ===============
" This loads all the plugins specified in ~/.vim/vundles.vim
" Use Vundle plugin to manage all other plugins
" PROBABLY DON'T NEED THIS (in Linux)
"if filereadable(expand("~/.vim/vundles.vim"))
"    source ~/.vim/vundles.vim
"endif

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tomtom/tcomment_vim'
"Plugin 'bling/vim-airline' " if on arch, recommend installing vim-airline w/ pacman
Plugin 'tpope/vim-fugitive'
Plugin 'tmhedberg/matchit'
Plugin 'gioele/vim-autoswap'
Plugin 'mhinz/vim-startify'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'vim-scripts/Color-Sampler-Pack'
Plugin 'airblade/vim-gitgutter'
Plugin 'majutsushi/tagbar'
Plugin 'mbbill/undotree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'L9'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'vim-scripts/xoria256.vim'
"Plugin 'file:///home/gmarik/path/to/plugin'
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"Plugin 'user/L9', {'name': 'newL9'}
call vundle#end()            " required
filetype plugin indent on    " required

" turn on syntax highlighting
syntax on

set laststatus=2

" set ; as easily accessible : (WHO uses ;?)
nnoremap ; :

" vim-taglist
nmap <F8> :TagbarToggle<CR>

" don't forget to be happy when you are coding!
au VimEnter * echom ">^_^<"

" ================ Background and Colors ============
"let solarized_termtrans=0 " transparent background
set background=dark
if &term == "xterm"
    set t_Co=256
    let g:airline_powerline_fonts=1
    " colorscheme monokai
    " colorscheme badwolf
    " colorscheme wombat256mod
    " airline - fancy fonts?
    " colorscheme jellybeans
    " colorscheme solarized
    " let g:airline_theme='solarized'
    colorscheme xoria256
    let g:airline_theme='badwolf'
else
    set t_Co=8
    colorscheme darkZ
    " let g:airline_theme='badwolf'
    " let g:airline_theme='luna'
    " let g:airline_theme='molokai'
    " let g:airline_theme='serene'
    let g:airline_theme='raven'
endif

" set background to be slightly transparent in solarized
"let g:solarized_termtrans=1 " messes up solarized light and other colorschemes

" change the colorscheme and AirlineTheme at the same time flawlessly
function! s:Color(scheme)
  execute "colorscheme " . a:scheme
  AirlineRefresh
endfunction

" make s:Color a little easier to call by making it a command
command! -nargs=1 CL call s:Color(<f-args>)

" Better idea is to map Caps to <esc>/<C> with:
"   setxkbmap -option 'caps:ctrl_modifier'
"   xcape -e 'Caps_Lock=Escape'
" inside of you .profile or rc
" However, this is an interesting idea:
"inoremap <S-j><S-j> <esc>
"vnoremap <S-j><S-j> <esc>

" settings
set noshiftround " don't round indent to multiple of 'shiftwidth'
set wrap " wrap text when reaches end
set number " show numbers on left
set relativenumber " show line number relative to other lines (if you like that)
set cursorline
set colorcolumn=81

"highlight LineNr term=NONE cterm=NONE ctermfg=red ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
"hi cursorline term=bold cterm=NONE ctermfg=NONE ctermbg=236 gui=NONE guifg=NONE guibg=NONE

" ================ General Config ====================
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
"set visualbell                  "No sounds --> this slows down vim (sometimes) significantly
set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=","

" ================ Turn Off Swap Files ==============
" :( keep using swap files ... that is unless you don't want to
"    for example, your battery could die and you lose all unsaved work
"set noswapfile
"set nobackup
"set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
" ****************************************************
" ** MAKE SURE THAT ~/.vim/undo/ EXISTS!            **
" ** otherwise this won't work (and it's awesome)   **
if has('persistent_undo')
    set undodir=~/.vim/undo
    set undofile
endif


" ================ Indentation ======================
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

set list "start show hidden characters on start
set listchars=eol:¬,tab:>-,trail:·,extends:>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<cr>

set scrolloff=4         "Start scrolling when we're 4 lines away from margins

" ================ Search ===========================
set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital


" toggle background from light to dark
nmap <leader>b :let &background=(&background == "light" ? "dark" : "light")<cr>:AirlineRefresh<cr>


set wildmenu        " visual autocomplete for command menu

" set lazyredraw      " redraw only when needed ==> is lazy! cursor doesn't
" start at the top with vundle

"if has('cmdline_info')
"    set ruler                   " show the ruler
"endif
