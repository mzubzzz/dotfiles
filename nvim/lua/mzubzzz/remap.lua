vim.g.mapleader = ","
vim.keymap.set("n", "<leader>e", vim.cmd.Oil) -- sets Oil as tree file viewer

local bufopts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>fe", vim.diagnostic.open_float, bufopts) -- shows full error
