require("mzubzzz.remap")
require("mzubzzz.set")
require("mzubzzz.packer")

vim.lsp.enable('gopls')
vim.lsp.config('ts_ls', {
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = "/usr/local/lib/node_modules/@vue/language-server",
        languages = {"javascript", "typescript", "vue", "typescriptreact",  "javascriptreact"},
      },
    },
  },
  filetypes = {
    "javascript",
    "typescript",
    "typescriptreact",
    "javascriptreact",
    "vue",
  }
})
vim.lsp.enable('ts_ls')
vim.lsp.enable('vue_ls')

