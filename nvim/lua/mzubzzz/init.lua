require("mzubzzz.remap")
require("mzubzzz.set")
require("mzubzzz.packer")

-- GO
vim.lsp.enable('gopls')

-- LUA
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {
          'vim',
          'require'
        },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  }
})
vim.lsp.enable('lua_ls')

-- ESLINT
vim.lsp.config('eslint', {
  on_attach = function(client, bufnr)
    vim.api.nvim_buf_create_user_command(bufnr, "EslintFixAll", function()
      -- vim.lsp.buf.execute_command({
        client:exec_cmd({
        command = "eslint.applyAllFixes",
        arguments = {
          { uri = vim.uri_from_bufnr(bufnr), version = vim.lsp.util.buf_versions[bufnr] }
        },
      })
    end, { desc = "Fix all ESLint errors" })
  end,
})
vim.lsp.enable('eslint')
-- elise auto fix on save for eslint supported file types
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { '*.js', '*.jsx', '*.ts', '*.tsx', '*.go', '*.lua', '*.vue' },
  callback = function()
    vim.cmd("silent! EslintFixAll")
  end,
})

-- JAVA
  vim.lsp.config('jdtls', { cmd = { 'jdtls' } })
  vim.lsp.enable('jdtls')

-- JS,TS, VUE, REACT
local vue_language_server_path = '/usr/local/lib/node_modules/@vue/language-server'
local tsserver_filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
local vue_plugin = {
  name = '@vue/typescript-plugin',
  location = vue_language_server_path,
  languages = { 'vue' },
  configNamespace = 'typescript',
}
local vtsls_config = {
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          vue_plugin,
        },
      },
    },
  },
  filetypes = tsserver_filetypes,
}
local vue_ls_config = {}
vim.lsp.config('ts_ls', {
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = "/usr/local/lib/node_modules/@vue/language-server",
        languages = {"javascript", "typescript", "vue", "typescriptreact",  "javascriptreact"},
        configNamespace = "typescript",
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
vim.lsp.config('vtsls', vtsls_config)
vim.lsp.config('vue_ls', vue_ls_config)
vim.lsp.enable({'vtsls', 'vue_ls'}) -- If using `ts_ls` replace `vtsls` to `ts_ls`

-- Errors inline
vim.diagnostic.config({
  -- virtual_lines = true,
   virtual_text = true,
})

-- auto highlighting words under cursor
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    -- 1. Verify the client supports highlighting
    if client and client.server_capabilities.documentHighlightProvider then
      local group = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = false })
      -- Clear existing autocmds for this buffer to avoid duplication
      vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })

      -- 2. Trigger highlight on CursorHold
      vim.api.nvim_create_autocmd("CursorHold", {
        group = group,
        buffer = bufnr,
        callback = vim.lsp.buf.document_highlight,
      })

      -- 3. Clear highlight on movement
      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        group = group,
        buffer = bufnr,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end,
})

-- update timeout to make sure CursorHold is triggered faster for document highlighting
vim.opt.updatetime = 300 -- milliseconds
