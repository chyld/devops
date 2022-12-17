return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")



use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}


use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
        vim.cmd('colorscheme rose-pine')
    end
})


use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
use('nvim-treesitter/playground')
use('mbbill/undotree')

use {
  'VonHeikemen/lsp-zero.nvim',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'saadparwaiz1/cmp_luasnip'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-nvim-lua'},

    -- Snippets
    {'L3MON4D3/LuaSnip'},
    {'rafamadriz/friendly-snippets'},
  }
}

use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = false }
}

use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
  tag = 'nightly' -- optional, updated every week. (see issue #1193)
}

-- using packer.nvim
use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}


    -- use("nvim-lua/plenary.nvim")         -- already got it from telescope!
    --
    --
    --use("nvim-lua/popup.nvim")
    --use("nvim-telescope/telescope.nvim")
    --use {
     -- 'nvim-lualine/lualine.nvim',
    --  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    --}
    --use 'nanozuki/tabby.nvim'
    --use "EdenEast/nightfox.nvim"
   -- use {'stevearc/dressing.nvim'}
    --use({ 'mrjones2014/legendary.nvim' })

    --use {
    --"williamboman/mason.nvim",
   -- "williamboman/mason-lspconfig.nvim",
    --"neovim/nvim-lspconfig",
--   }
  -- use 'karb94/neoscroll.nvim'
end)

