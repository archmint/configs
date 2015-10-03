" ~/.vimrc

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" ================ Background and Colors ============
"let solarized_termtrans=0 " transparent background
set background=dark
if &term == "xterm"
    set t_Co=256
    colorscheme solarized
endif

highlight LineNr term=NONE cterm=NONE ctermfg=red ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
set cursorline
hi cursorline term=bold cterm=NONE ctermfg=NONE ctermbg=236 gui=NONE guifg=NONE guibg=NONE

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

" turn on syntax highlighting
syntax on

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=","

" =============== Vundle Initialization ===============
" This loads all the plugins specified in ~/.vim/vundles.vim
" Use Vundle plugin to manage all other plugins
" PROBABLY DON'T NEED THIS (in Linux)
"if filereadable(expand("~/.vim/vundles.vim"))
"    source ~/.vim/vundles.vim
"endif

" ================ Turn Off Swap Files ==============
" :( keep using swap files ... that is unless you don't want to
"    for example, your battery could die and you lose all unsaved work
"set noswapfile
"set nobackup
"set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
" *****************************************
" ** MAKE SURE THAT ~/.vim/undo/ EXISTS! **
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

"filetype plugin on
"filetype indent on

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
nmap <leader>b :let &background=(&background == "light" ? "dark" : "light")<cr>


set wildmenu        " visual autocomplete for command menu

set lazyredraw      " redraw only when needed

if has('cmdline_info')
    set ruler                   " show the ruler
endif

let crazy_status=0 " SET TO 1 IF YOU WANT A COOL BUT RESOURCE-INTENSIVE STATUSLINE  (I worked hard on this... :P it's a little too much, sometimes, though)
if has('statusline') && crazy_status
    set laststatus=2
    set statusline=%F%m%r%h%w\ [%4l,%4v]\ [%p%%]%=[FORMAT=%{&ff}]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [LEN=%L] 

    if version >= 700
        function! NormalHighlight()
            hi StatusLine ctermfg=none
        endfunction

        function! InsertHighlight()
            hi StatusLine ctermfg=226
        endfunction

        function! ReplaceHighlight()
            hi StatusLine ctermfg=208
        endfunction

        function! VisualHighlight()
            hi StatusLine ctermfg=112
        endfunction

        function! RedrawStatuslineColors(mode)
            if a:mode == 'n'
                call NormalHighlight()
            elseif a:mode == 'i'
                call InsertHighlight()
            elseif a:mode == 'R'
                call ReplaceHighlight()
            elseif a:mode == 'v' || a:mode == 'V' || a:mode == '^V'
                call VisualHighlight()
            endif
        endfunction

        let &stl.='%{RedrawStatuslineColors(mode())}'
    endif
endif

" Fix youcompleteme for non-code files
" must install vim-youcompleteme (in aptitude)
"let ycm_filetype_whitelist = { 'cpp': 1, 'c': 1, 'python':1 }

