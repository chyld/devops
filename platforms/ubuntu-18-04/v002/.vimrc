" --------------------------------------------------
" --------------------------------------------------
" --------------------------------------------------

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()            " required
filetype plugin indent on    " required

" --------------------------------------------------
" --------------------------------------------------
" --------------------------------------------------

" http://vimdoc.sourceforge.net/htmldoc/options.html

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

" --------------------------------------------------
" --------------------------------------------------
" --------------------------------------------------

let g:airline_theme='simple'

" --------------------------------------------------
" --------------------------------------------------
" --------------------------------------------------

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

" --------------------------------------------------
" --------------------------------------------------
" --------------------------------------------------

