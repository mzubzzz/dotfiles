vim.g.mapleader = ","
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

local bufopts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>fe", vim.diagnostic.open_float, bufopts)
