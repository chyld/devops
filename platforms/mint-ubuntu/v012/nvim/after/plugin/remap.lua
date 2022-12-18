local builtin = require('telescope.builtin')

vim.g.mapleader = " "
vim.o.timeoutlen = 1000
vim.keymap.set("n", "<leader>play", vim.cmd.TSPlaygroundToggle, {desc = 'Treesitter Playground'})

vim.keymap.set("n", "<leader>tt", vim.cmd.NvimTreeToggle, {desc = 'Tree Toggle'})
vim.keymap.set("n", "<leader>tf", vim.cmd.NvimTreeFocus, {desc = 'Tree Focus'})

vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = 'Find Files'})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = 'Find Grep'})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = 'Find Buffers'})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = 'Find Help'})

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, {desc = 'Undo Tree'})

