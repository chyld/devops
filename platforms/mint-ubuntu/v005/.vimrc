" use :set all to view all options, default or otherwise
" ------------------------------------------------------

" not vi compatible
set nocompatible

call plug#begin()
Plug 'tpope/vim-sensible'
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

" do not wrap lines
set nowrap

" use spaces not tabs
set expandtab

" set a tab to two spaces
set tabstop=2

" set indention to two spaces
set shiftwidth=2

" incremental search (as string is being typed)
set incsearch

" highlight search
set hls

" show lines above and below cursor (when possible)
set scrolloff=3

" to always display the status line
set laststatus=2

" show current command
set showcmd

" search regardless of case
set ignorecase

" if search contains uppercase, then switches to case-sensitive search
set smartcase

" show current positon in file
set ruler

" turn on line numbering
set number

" relative line numbering
set rnu

" enable mouse mode (scrolling, selection, etc)
set mouse+=a

" show trailing spaces
set list listchars=tab:‣‧,trail:•

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

