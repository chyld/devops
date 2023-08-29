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

-- ### ----------------------------------------------------------------------------------------- ###
-- ### ----------------------------------------------------------------------------------------- ###
-- ### ----------------------------------------------------------------------------------------- ###

vim.g.mapleader = ' '       -- change leader key to spacebar
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>')      -- in normal mode, save file
vim.keymap.set('n', '<leader>q', '<cmd>quit<cr>')       -- in normal mode, quit

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
})

-- ### ----------------------------------------------------------------------------------------- ###
-- ### ----------------------------------------------------------------------------------------- ###
-- ### ----------------------------------------------------------------------------------------- ###

vim.opt.termguicolors = true
vim.cmd.colorscheme('tokyonight')
require('lualine').setup()

-- ### ----------------------------------------------------------------------------------------- ###
-- ### ----------------------------------------------------------------------------------------- ###
-- ### ----------------------------------------------------------------------------------------- ###

