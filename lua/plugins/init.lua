return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "python",
        "javascript",
        "typescript",
        "htmldjango",
      },
    },
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "BufEnter",
  },
  {
    "nvim-neorg/neorg",
    version = "^7",
    build = ":Neorg sync-parsers",
    event = "VeryLazy",
    dependecies = {
      {
        "nvim-lua/plenary.nvim",
      },
      { "nvim-treesitter/nvim-treesitter",
        opts = {
          auto_install = true,
          highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
          },
        },
        config = function(_, opts)
          require('nvim-treesitter.configs').setup(opts)
        end
      },
    },
    opts = {
      load = {
        ["core.defaults"] = {}, -- Loads default behavior
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.keybinds"] = {}, -- Adds defaults keybindings
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
          },
        }, -- Enables support for completion plugins
        ["core.journal"] = {}, -- Enables support for completion plugins
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/documents/repos/notes",
            },
            default_workspace = "notes",
          },
        },
      },
    },
  },
}
