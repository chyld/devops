-- ### ----------------------------------------------------------------------------------------- ###
-- ### ----------------------------------------------------------------------------------------- ###
-- ### ----------------------------------------------------------------------------------------- ###

vim.opt.list = true         -- show hidden characters
vim.opt.listchars = {
    space = '·',
    tab = '▸ ',
    trail = '·',
}

vim.opt.tabstop = 4         -- set these as a group
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.number = true       -- enable line numbers
vim.opt.mouse = 'a'         -- enable mouse
vim.opt.ignorecase = true   -- ignore case when searching
vim.opt.smartcase = true    -- used with ignorecase
vim.opt.hlsearch = false    -- does not show search terms highlighted, which is annoying
vim.opt.wrap = false        -- do not wrap long lines
vim.opt.scrolloff = 3       -- always show at least 3 spaces above and below cursor
vim.opt.colorcolumn = '100' -- vertial stripe
vim.opt.updatetime = 250    -- time for swap file to be written
vim.opt.timeoutlen = 300    -- waits 300ms for a mapped sequence to complete

-- ### ----------------------------------------------------------------------------------------- ###
-- ### ----------------------------------------------------------------------------------------- ###
-- ### ----------------------------------------------------------------------------------------- ###

vim.g.mapleader = ' '       -- change leader key to spacebar
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>')      -- in normal mode, save file
vim.keymap.set('n', '<leader>q', '<cmd>quit<cr>')       -- in normal mode, quit
vim.keymap.set('n', '<leader>t', '<cmd>Neotree<cr>')    -- in normal mode, Neotree

-- ### ----------------------------------------------------------------------------------------- ###
-- ### ----------------------------------------------------------------------------------------- ###
-- ### ----------------------------------------------------------------------------------------- ###

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ### ----------------------------------------------------------------------------------------- ###
-- ### ----------------------------------------------------------------------------------------- ###
-- ### ----------------------------------------------------------------------------------------- ###

require("lazy").setup({
    "folke/which-key.nvim",
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    "folke/neodev.nvim",
    'folke/tokyonight.nvim',
    'nvim-lualine/lualine.nvim',
    'nvim-tree/nvim-web-devicons',
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        }
    },
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                              , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
})

-- ### ----------------------------------------------------------------------------------------- ###
-- ### ----------------------------------------------------------------------------------------- ###
-- ### ----------------------------------------------------------------------------------------- ###

vim.opt.termguicolors = true
vim.cmd.colorscheme('tokyonight')
require('lualine').setup()

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- ### ----------------------------------------------------------------------------------------- ###
-- ### ----------------------------------------------------------------------------------------- ###
-- ### ----------------------------------------------------------------------------------------- ###

