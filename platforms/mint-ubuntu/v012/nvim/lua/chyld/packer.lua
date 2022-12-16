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

