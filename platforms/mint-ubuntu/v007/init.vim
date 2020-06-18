" https://medium.com/better-programming/setting-up-neovim-for-web-development-in-2020-d800de3efacd
" https://github.com/erkrnt/awesome-streamerrc/blob/master/ThePrimeagen/init.vim
" https://nvie.com/posts/how-i-boosted-my-vim/

" PLUGINS
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
call plug#begin("~/.vim/plugged")
  Plug 'dracula/vim'
  Plug 'morhetz/gruvbox'
  Plug 'scrooloose/nerdtree'
  Plug 'mhinz/vim-startify'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'mbbill/undotree'
call plug#end()

" BASICS
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
syntax enable                           " switches on syntax highlighting
set termguicolors                       " enable 24-bit color
set number                              " turn on line numbering
set list listchars=tab:»·,trail:•       " default view for hidden characters
set mouse=a                             " enable mouse
set nowrap                              " do not wrap lines

set tabstop=2                           " 1 tab == 2 spaces
set softtabstop=2                       " make it soft
set shiftwidth=2                        " indent to 2 spaces
set expandtab                           " tabs to spaces
set autoindent                          " copy indent from current line
set smartindent                         " sweet, sweet indenting

set incsearch                           " search as you type
set hlsearch                            " highlight matches
set smartcase                           " if search contains uppercase, then switches to case-sensitive search

" COLORSCHEMES
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
colorscheme gruvbox                     " gruvbox, dracula

" LEADER MAPPING
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
let mapleader=","

" NERDTREE
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
let g:NERDTreeShowHidden = 1
nnoremap <leader>n :NERDTreeToggle<cr>

" HIDDEN CHARACTERS
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
nnoremap <leader>lid :set list listchars=space:·,tab:»·,trail:•,eol:↲<cr> " list details
nnoremap <leader>lib :set list listchars=tab:»·,trail:•<cr>               " list basics

" FZF
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
nnoremap <leader>f :FZF<cr>                   " default
nnoremap <leader>b :Buffers<cr>               " open buffers
nnoremap <leader>a :Ag<cr>                    " use silver searcher
nnoremap <leader>r :Rg<cr>                    " use rip grep
nnoremap <leader>c :Colors<cr>                " switch color themes

" Undotree
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
nnoremap <leader>u :UndotreeToggle<cr>        " togle undo tree

" END
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------

