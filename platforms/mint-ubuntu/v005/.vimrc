" :set all -- to see all settings

filetype plugin indent on
syntax enable

call plug#begin()
Plug 'junegunn/goyo.vim'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'townk/vim-autoclose'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

set expandtab                     " tabs to spaces
set tabstop=2                     " 1 tab == 2 spaces
set shiftwidth=2                  " indent to 2 spaces
set autoindent                    " copy indent from current line when starting a new line
set smartindent                   " even better autoindent

set backspace=indent,eol,start    " allow backspace
set complete-=i                   " enables autocomplete
set laststatus=2                  " always display status line
set showcmd                       " show current command
set list listchars=tab:‣‧,trail:• " show trailing spaces
set wildmenu                      " enable menu
set wildmode=list:longest,full    " menu config
set mouse=a                       " enable mouse support
set nowrap                        " do not wrap lines
set scrolloff=3                   " show lines above and below cursor
set autoread                      " autmatically read in external file changes
set history=5000                  " keep 5000 lines of command line history
set showmatch                     " show matching bracets when text indicator is over them
set lazyredraw                    " redraw only when we need to
set visualbell                    " blink cursor on error, instead of beeping
set magic                         " used with regular expressions
set encoding=utf-8                " set encoding to utf-8

set nobackup                      " do not keep backup files
set nowb                          " do not make a backup
set noswapfile                    " do not write annoying intermediate swap files

set ruler                         " show line and column number in status
set number                        " turn on line numbering

set incsearch                     " search as you type
set hlsearch                      " highlight matches
set ignorecase                    " search regardless of case
set smartcase                     " if search contains uppercase, then switches to case-sensitive search

" -----------------------------------------------------------------------------
" PLUGINS
" -----------------------------------------------------------------------------

" changing leader key to comma
let mapleader = ","

" open nerdtree with leader + n
noremap <leader>n :NERDTree<cr>

" to find files using ctrlp
noremap <leader>p :CtrlP<cr>

" to switch to goyo (zen) mode
noremap <leader>g :Goyo<cr>

" show FZF finder
noremap <leader>f :FZF<cr>
noremap <leader>b :Buffers<cr>
noremap <leader>a :Ag<cr>

" -----------------------------------------------------------------------------
" FIN
" -----------------------------------------------------------------------------

