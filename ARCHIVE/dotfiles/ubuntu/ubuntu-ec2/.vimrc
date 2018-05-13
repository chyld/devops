" http://vimdoc.sourceforge.net/htmldoc/options.html

set nocompatible                                 " be iMproved
filetype off                                     " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'groenewege/vim-less'

call vundle#end()

" ---------------------------------------------------------------- ***
" ---------------------------------------------------------------- ***
" ---------------------------------------------------------------- ***

filetype plugin indent on
syntax on

set mouse=a                                      " enable mouse support
set autoread                                     " autmatically read in external file changes
set backspace=indent,eol,start                   " allow backspacing over everything in insert mode
set history=500                                  " keep 100 lines of command line history
set ruler                                        " show the cursor position all the time
set showcmd                                      " display incomplete commands
set cmdheight=1                                  " the commandbar height
set incsearch                                    " do incremental searching
set hlsearch                                     " highlight search terms
set ignorecase                                   " ignore case during searches
set showmatch                                    " show matching bracets when text indicator is over them
set number                                       " turn on line numbering
set expandtab                                    " use spaces instead of tabs
set tabstop=2                                    " insert 2 spaces whenever the tab key is pressed
set shiftwidth=2                                 " set indentation to 2 spaces
set autoindent                                   " start new line at the same indentation level
set nobackup                                     " do not keep backup files, it's 70's style cluttering
set noswapfile                                   " do not write annoying intermediate swap files
set wrap!                                        " turn off word wrapping

" render ejs files like html
au BufNewFile,BufRead *.ejs set filetype=html

" setting timeout lengths
set timeoutlen=1000
set ttimeoutlen=50

" stop annoying sound on errors
set noerrorbells
set novisualbell

" enable 256 color mode
set t_Co=256

" turn on utf-8 file encoding
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8

" show trailing spaces
set list listchars=tab:‣‧,trail:•

" changing leader key to comma
let mapleader = ","

" open nerdtree with leader + n
noremap <leader>n :NERDTree<cr>

" to find files using ctrlp
noremap <leader>f :CtrlP<cr>

" to find buffers using ctrlp
noremap <leader>b :CtrlPBuffer<cr>

" sets the working directory for ctrlp
let g:ctrlp_working_path_mode = 'a'

" create horizontal & vertical splits
noremap <leader>h :sp<cr>
noremap <leader>v :vsp<cr>

" window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" tab navigation
noremap <C-t> :tabn<cr>
noremap <C-n> :tabnew<cr>

