vim.cmd("colorscheme nightfox")
require('lualine').setup {
   options = { theme = 'molokai' }
}
require('tabby').setup()
require('dressing').setup()
require('legendary').setup()
require("mason").setup()
require("mason-lspconfig").setup()

require("lspconfig").sumneko_lua.setup {}
require'lspconfig'.pyright.setup {}

