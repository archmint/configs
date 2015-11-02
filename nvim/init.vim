" ~/.config/nvim/init.vim

" functionality
set nocompatible
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')
Plugin 'VundleVim/Vundle.vim'
" Plugins that blend in
Plugin 'L9'
Plugin 'Raimondi/delimitMate'
Plugin 'Valloric/YouCompleteMe'
Plugin 'edkolev/tmuxline.vim'
Plugin 'ervandew/supertab'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'luochen1990/rainbow'
Plugin 'scrooloose/syntastic'
Plugin 'sickill/vim-pasta'
Plugin 'tmhedberg/matchit'
Plugin 'vim-airline'
Plugin 'vim-scripts/SearchComplete'
" Plugins that don't blend in (require more insight as to how they work ... key bindings, etc)
Plugin 'a.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ctrlp.vim'
Plugin 'gioele/vim-autoswap'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/Color-Sampler-Pack'
Plugin 'vim-scripts/align'
Plugin 'vim-signature'
" Color and fun :)
Plugin 'morhetz/gruvbox'
Plugin 'vim-scripts/TeTrIs.vim'
Plugin 'vim-scripts/xoria256.vim'
call vundle#end()
filetype plugin indent on

set history=10000
set autoread
set hidden
" let mapleader=','
set scrolloff=4
set mouse=""
set virtualedit=block

" let vim autoswap in tmux (uses vim-autoswap)
" (if using autoswap ... for this turn off noswapfil, no backup, nowb)
" ** requires swap files **
let g:autoswap_detect_tmux = 1

" undo (do not change order)
" set noswapfile
" set nobackup
" set nowb
set undodir=~/.local/share/nvim/backup
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

" pretty
" colors
syntax on
set t_Co=256
let g:airline_powerline_fonts=1
let g:airline_theme='badwolf'
colorscheme monokai
" inside window
set cursorline
set colorcolumn=81,121
set list
set listchars=eol:¬,tab:▸\ ,extends:»,trail:·
" outside window
set relativenumber
set number
set laststatus=2
set noshowmode
set wildmenu

" don't be bad ;)
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

"Make YCM/Snipmate/Supertab/Syntastic play nice together
let g:SuperTabDefaultCompletionType = '<C-Tab>'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_key_list_previous_completion = ['<C-S-TAB>', '<Up>']
let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>']
let g:ycm_register_as_syntastic_checker = 1

" activate rainbow parens
let g:rainbow_active = 1

" Some nice leader configuration for visual preferences
" toggle background from light to dark
nnoremap <leader>b :silent let &background=(&background == "light" ? "dark" : "light")<cr>:silent AirlineRefresh<cr>:<cr>
nnoremap <silent> <leader>r :silent set relativenumber!<cr>:<cr>

" fun colorschems :)
nnoremap <silent> <leader>[s :set background=dark<cr>:colorscheme solarized<cr>:AirlineTheme luna<cr>:AirlineRefresh<cr>
nnoremap <silent> <leader>[j :set background=dark<cr>:colorscheme jellybeans<cr>:AirlineTheme jellybeans<cr>:AirlineRefresh<cr>
nnoremap <silent> <leader>[x :set background=dark<cr>:colorscheme xoria256<cr>:AirlineTheme badwolf<cr>:AirlineRefresh<cr>
nnoremap <silent> <leader>[g :set background=dark<cr>:colorscheme gruvbox<cr>:AirlineTheme lucius<cr>:AirlineRefresh<cr>
nnoremap <silent> <leader>[m :set background=dark<cr>:colorscheme monokai<cr>:AirlineTheme badwolf<cr>:AirlineRefresh<cr>

" ;) VOICE
" nnoremap <silent> <leader>[L :silent !(espeak 'groove box ... jellybeans ... monokai ... solarized ... xoria'&) > /dev/null<cr>
" nnoremap <silent> <leader>[G :set background=dark<cr>:colorscheme gruvbox<cr>:AirlineTheme lucius<cr>:AirlineRefresh<cr>:silent exec "!(espeak 'groove box') > /dev/null"<cr>
" nnoremap <silent> <leader>[J :set background=dark<cr>:colorscheme jellybeans<cr>:AirlineTheme jellybeans<cr>:AirlineRefresh<cr>:silent exec "!(espeak 'jellybeans') > /dev/null"<cr>
" nnoremap <silent> <leader>[M :set background=dark<cr>:colorscheme monokai<cr>:AirlineTheme badwolf<cr>:AirlineRefresh<cr>:silent exec "!(espeak 'monokai') > /dev/null"<cr>
" nnoremap <silent> <leader>[S :set background=dark<cr>:colorscheme solarized<cr>:AirlineTheme luna<cr>:AirlineRefresh<cr>:silent exec "!(espeak 'solarized') > /dev/null"<cr>
" nnoremap <silent> <leader>[X :set background=dark<cr>:colorscheme xoria256<cr>:AirlineTheme badwolf<cr>:AirlineRefresh<cr>:silent exec "!(espeak 'xoria') > /dev/null"<cr>

" ;) notifications
" nnoremap <silent> <leader>[G :set background=dark<cr>:colorscheme gruvbox<cr>:AirlineTheme lucius<cr>:AirlineRefresh<cr>:silent exec "! echo 'gruvbox theme selected' \| dzen2 -fn 'Inconsolata Medium' -y -60 -p 1"<cr>
nnoremap <silent> <leader>[G :set background=dark<cr>:colorscheme gruvbox<cr>:AirlineTheme lucius<cr>:AirlineRefresh<cr>:silent exec "! ~/bin/notif.sh gruvbox with lucius theme selected"<cr>
nnoremap <silent> <leader>[J :set background=dark<cr>:colorscheme jellybeans<cr>:AirlineTheme jellybeans<cr>:AirlineRefresh<cr>:silent exec "! ~/bin/notif.sh jellybeans with jellybeans theme selected"<cr>
nnoremap <silent> <leader>[M :set background=dark<cr>:colorscheme monokai<cr>:AirlineTheme badwolf<cr>:AirlineRefresh<cr>:silent exec "! ~/bin/notif.sh monokai with badwolf theme selected"<cr>
nnoremap <silent> <leader>[S :set background=dark<cr>:colorscheme solarized<cr>:AirlineTheme luna<cr>:AirlineRefresh<cr>:silent exec "! ~/bin/notif.sh solarized with luna theme selected"<cr>
nnoremap <silent> <leader>[X :set background=dark<cr>:colorscheme xoria256<cr>:AirlineTheme badwolf<cr>:AirlineRefresh<cr>:silent exec "! ~/bin/notif.sh xoria256 with badwolf theme selected"<cr>

" if you ever need to read a pdf in a hurry ...
au BufRead *.pdf sil exe "!(libreoffice % &) > /dev/null"
