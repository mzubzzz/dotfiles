vim.g.mapleader = ","
vim.keymap.set("n", "<leader>e", vim.cmd.Oil) -- sets Oil as tree file viewer

local bufopts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>fe", vim.diagnostic.open_float, bufopts) -- shows full error

local findRef = { noremap = true, silent = true }
vim.keymap.set("n", "gr", vim.lsp.buf.references, findRef) -- finds references

vim.keymap.set("n", "<leader>cl", function()
  local filename = vim.fn.expand("%:t") -- Get filename only (without path)
  local line = "console.log('" .. filename ..  "')"
  vim.api.nvim_buf_set_lines(0, vim.api.nvim_win_get_cursor(0)[1], vim.api.nvim_win_get_cursor(0)[1], false, {line})

end, { noremap = true, silent = true, desc = "inserts console.log" })

vim.keymap.set("n", "<leader>ct", function()
  local filename = vim.fn.expand("%:t") -- Get filename only (without path)
  local line = "console.trace('" .. filename .. "')"
  vim.api.nvim_buf_set_lines(0, vim.api.nvim_win_get_cursor(0)[1], vim.api.nvim_win_get_cursor(0)[1], false, {line})
end, { noremap = true, silent = true, desc = "inserts console.trage" })

vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })
