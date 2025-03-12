" PLUGINS
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------

call plug#begin("~/.vim/plugged")
  Plug 'github/copilot.vim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'morhetz/gruvbox'
call plug#end()

" CONFIG
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------

set termguicolors                    " icon colors in telescope
set number                           " line numbers
set mouse=a                          " mouse support
set list listchars=tab:»·,trail:•    " see spaces and tabs
set nowrap                           " don't wrap lines
set ignorecase                       " ignore case during search
set smartcase                        " do not ignore case if using capital letters
set guitablabel=%t                   " use file name, not path, as tab label
colorscheme gruvbox                  " set color scheme

" Setting spacing for default file types
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Setting spaccing for specific file types
autocmd Filetype html       setlocal ts=2 sw=2 sts=2
autocmd Filetype css        setlocal ts=2 sw=2 sts=2
autocmd Filetype html       setlocal ts=2 sw=2 sts=2
autocmd Filetype javascript setlocal ts=2 sw=2 sts=2
autocmd Filetype typescript setlocal ts=2 sw=2 sts=2
autocmd Filetype python     setlocal ts=2 sw=2 sts=2

" Leader key
let g:mapleader="\<Space>"

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" LUA block
lua << END
  require'lualine'.setup()
  require'nvim-tree'.setup()
END

" Tree shortcut keys
nnoremap <leader>t :NvimTreeToggle<CR>

" Cycle through windows and tabs
nmap <silent> <A-Left> :wincmd p<CR>
nmap <silent> <A-Right> :wincmd w<CR>
nmap <silent> <A-Up> :tabnext<CR>
nmap <silent> <A-Down> :tabprevious<CR>

" END OF CONFIG
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
