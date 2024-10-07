-- KEYMAPS
local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
  local opts = {buffer = bufnr, remap = false}
  -- runs code action
  vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, opts)
end)

-- completion keymaps
local cmp = require('cmp')
cmp.setup({
    mapping = {
        ['<Enter>'] = cmp.mapping.confirm({select = false}),
    }
})

-- SERVERS
require'lspconfig'.ts_ls.setup{
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
  },
}

-- tsserver is deprecated
-- require'lspconfig'.tsserver.setup{
--   init_options = {
--     plugins = {
--       {
--         name = "@vue/typescript-plugin",
--         location = "/usr/local/lib/node_modules/@vue/language-server",
--         languages = {"javascript", "typescript", "vue", "typescriptreact",  "javascriptreact"},
--       },
--     }
--   },
--   filetypes = {
--     "javascript",
--     "typescript",
--     "typescriptreact",
--     "javascriptreact",
--     "vue",
--   },
-- }

require'lspconfig'.eslint.setup({
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})

require'lspconfig'.graphql.setup{}

require'lspconfig'.lua_ls.setup {
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
      return
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          -- Depending on the usage, you might want to add additional paths here.
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
        }
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
        -- library = vim.api.nvim_get_runtime_file("", true)
      }
    })
  end,
  settings = {
    Lua = {}
  }
}

require'lspconfig'.bashls.setup{}

require'lspconfig'.java_language_server.setup{
    cmd = { "/home/mzubzzz/Repos/github/java-language-server/dist/lang_server_linux.sh" };
}

require'lspconfig'.volar.setup{
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
}

require'lspconfig'.clangd.setup{}
