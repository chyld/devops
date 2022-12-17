local builtin = require('telescope.builtin')

vim.g.mapleader = " "
vim.o.timeoutlen = 5000
vim.keymap.set("n", "<leader>play", vim.cmd.TSPlaygroundToggle)

vim.keymap.set("n", "<leader>tt", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>tf", vim.cmd.NvimTreeFocus)

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

