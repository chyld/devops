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
let mapleader=" "

" NERDTREE
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
let g:NERDTreeShowHidden = 1
nnoremap <leader>n :NERDTreeToggle<cr>

" ------------------------------------ +
" WARNING :: DO NOT PUT COMMENTS AFTER KEY REMAP, BAD THINGS HAPPEN
" ------------------------------------ +

" HIDDEN CHARACTERS
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
nnoremap <leader>lid :set list listchars=space:·,tab:»·,trail:•,eol:↲<cr>
nnoremap <leader>lib :set list listchars=tab:»·,trail:•<cr>

" FZF
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
" default fzf, open buffers, silver searcher, rip grep, color themes
nnoremap <leader>f :Files<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>a :Ag<cr>
nnoremap <leader>r :Rg<cr>
nnoremap <leader>c :Colors<cr>
nnoremap <leader>g :GFiles?<cr>

" Undotree
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
nnoremap <leader>u :UndotreeToggle<cr>

" Movements
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
nnoremap <leader>t gt
nnoremap <leader>h :wincmd h<cr>
nnoremap <leader>j :wincmd j<cr>
nnoremap <leader>k :wincmd k<cr>
nnoremap <leader>l :wincmd l<cr>

" END
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------

