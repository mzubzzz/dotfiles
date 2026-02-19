vim.g.mapleader = ","
vim.keymap.set("n", "<leader>e", vim.cmd.Oil) -- sets Oil as tree file viewer

local bufopts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>fe", vim.diagnostic.open_float, bufopts) -- shows full error

vim.keymap.set("n", "gr", vim.lsp.buf.references, { noremap = true, silent = true }) -- finds references

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true }) -- finds references

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

local on_attach = function(_, bufnr)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr })
  vim.keymap.set('v', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr })
end

vim.lsp.config("*", { on_attach = on_attach })

-- Change <C-Space> to trigger LSP completion
vim.keymap.set('i', '<C-Space>', '<C-n>', { desc = "Trigger LSP completion" })

vim.keymap.set('i', '<CR>', function()
  return vim.fn.pumvisible() ~= 0 and '<C-y>' or '<CR>'
end, { expr = true })

