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
set cursorline                       " see the cursor
set ignorecase                       " ignore case during search
set smartcase                        " do not ignore case if using capital letters
colorscheme gruvbox                  " set color scheme

let mapleader=" "

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" lualine configuration
lua << END
require'lualine'.setup()
END

" END OF CONFIG
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
