" http://vimdoc.sourceforge.net/htmldoc/options.html

set nocompatible                                 " be iMproved
filetype off                                     " required!

call plug#begin('~/.vim/plugged')
Plug 'fatih/molokai'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  #
" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  #
" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  #

filetype plugin indent on
syntax on

set mouse=a                                      " enable mouse support
set number                                       " turn on line numbering
set backspace=indent,eol,start                   " allow backspacing over everything in insert mode
set ruler                                        " show the cursor position all the time
set autowrite                                    " save on buffer switch
set expandtab                                    " use SPACES, do expand tabs into spaces
set tabstop=2                                    " insert 2 spaces whenever the tab key is pressed
set shiftwidth=2                                 " set indentation to 2 spaces
set list listchars=tab:‣‧,trail:•                " show tabs & trailing spaces
set autoread                                     " autmatically read in external file changes
set history=500                                  " keep 500 lines of command line history
set showcmd                                      " display incomplete commands
set cmdheight=1                                  " the commandbar height
set incsearch                                    " do incremental searching
set hlsearch                                     " highlight search terms
set ignorecase                                   " ignore case during searches
set showmatch                                    " show matching bracets when text indicator is over them
set autoindent                                   " start new line at the same indentation level
set nobackup                                     " do not keep backup files, it's 70's style cluttering
set noswapfile                                   " do not write annoying intermediate swap files
set wrap!                                        " turn off word wrapping
set noerrorbells                                 " stop error sounds
set novisualbell                                 " stop error visuals
set t_Co=256                                     " enable 256 colors
set encoding=utf-8                               " monitor
set termencoding=utf-8                           " file
set fileencoding=utf-8                           " keyboard

" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  #
" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  #
" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  #

" https://github.com/tomasr/molokai

let g:rehash256 = 1
let g:molokai_original = 1
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1
colorscheme molokai

" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  #
" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  #
" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  #

let mapleader=","
noremap <leader>n :NERDTreeToggle<cr>                " Nerd toggle
noremap <leader>f :CtrlP<cr>                         " Find files with Ctrl-P
noremap <leader>b :CtrlPBuffer<cr>                   " Find buffers with Ctrl-P
noremap <leader>h :sp<cr>                            " Split Horizontal
noremap <leader>v :vsp<cr>                           " Split Vertical
noremap <C-h> <C-w>h                                 " Window Move Left
noremap <C-j> <C-w>j                                 " Window Move Down
noremap <C-k> <C-w>k                                 " Window Move Up
noremap <C-l> <C-w>l                                 " Window Move Right

" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  #
" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  #
" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  #
