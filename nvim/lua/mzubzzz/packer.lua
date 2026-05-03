vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- telescope fusy finder
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- theme
  use ({
    'folke/tokyonight.nvim',
    config = function()
      vim.cmd('colorscheme tokyonight')
    end
  })

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  -- git
  use 'tpope/vim-fugitive'

  -- undo
  use 'mbbill/undotree'

  -- comments
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- hex colors
  use 'norcalli/nvim-colorizer.lua'
  require'colorizer'.setup()

  -- markdown preview
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- adoc preview
  use({
    'tigion/nvim-asciidoc-preview',
    run = 'cd server && npm install --omit=dev',
    config = function()
      require('asciidoc-preview').setup({})
    end,
  })

  -- Oil file viewer
  use({
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup()
    end,
  })
  -- Diagnostic in oii viewer
  use({
    "JezerM/oil-lsp-diagnostics.nvim",
    dependencies = { "stevearc/oil.nvim" },
    opts = {},
    config = function()
      require("oil-lsp-diagnostics").setup({
        count = true,
        parent_dirs = true,
        diagnostic_colors = {
          error = "DiagnosticError",
          warn  = "DiagnosticWarn",
          info  = "DiagnosticInfo",
          hint  = "DiagnosticHint",
        },
        diagnostic_symbols = {
          error = "",
          warn = "",
          info = "",
          hint = "󰌶",
        }
      })
    end,
  })

  -- Better staus line and mini icons
  use({
    "echasnovski/mini.nvim",
    config = function()
      -- status line
      local statusline = require("mini.statusline")
      statusline.setup { use_icons = true }
      -- mini icons
      require("mini.icons").setup()
    end,
  })

  -- java plugin
  use 'mfussenegger/nvim-jdtls'

  -- copilot chat
  use({
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {},
  })

  -- align text
  use 'junegunn/vim-easy-align'

end)
