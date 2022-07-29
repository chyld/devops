" PLUGINS
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------

" plugins stored in ~/.vim/plugged
" you can delete directory and reinstall if needed
call plug#begin("~/.vim/plugged")
  Plug 'kyazdani42/nvim-web-devicons' " icons
  Plug 'kyazdani42/nvim-tree.lua'     " file tree view
  Plug 'nvim-lualine/lualine.nvim'    " status line
  Plug 'morhetz/gruvbox'              " color theme
  " telescope and dependencies
  " :checkhealth telescope
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " it may error, just exit and do :PlugUpdate
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

" LUA block
lua << END
  require'nvim-tree'.setup()
  require'lualine'.setup()
END

" Tree shortcut keys
nnoremap <leader>t :NvimTreeToggle<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Cycle through windows and tabs
nmap <silent> <A-Left> :wincmd p<CR>
nmap <silent> <A-Right> :wincmd w<CR>
nmap <silent> <A-Up> :tabnext<CR>
nmap <silent> <A-Down> :tabprevious<CR>

" END OF CONFIG
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------

