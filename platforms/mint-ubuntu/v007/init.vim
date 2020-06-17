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
call plug#end()

" BASICS
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
syntax enable                           " switches on syntax highlighting
set termguicolors                       " enable 24-bit color
set number                              " turn on line numbering
set list listchars=tab:»·,trail:•       " default view for hidden characters
set tabstop=2                           " 1 tab == 2 spaces
set shiftwidth=2                        " indent to 2 spaces
set expandtab                           " tabs to spaces
set mouse=a                             " enable mouse
set nowrap                              " do not wrap lines

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

" SHORTCUTS
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
nnoremap <leader>lid :set list listchars=space:·,tab:»·,trail:•,eol:↲<cr> " list details
nnoremap <leader>lib :set list listchars=tab:»·,trail:•<cr>               " list basics

" END
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------

