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
    "folke/todo-comments.nvim",
    event = "BufEnter",
    dependecies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "nvim-neorg/neorg",
    version = "^7",
    -- build = ":Neorg sync-parsers",
    event = "VeryLazy",
    dependecies = {
      {
        "nvim-lua/plenary.nvim",
      },
      {
        "nvim-treesitter/nvim-treesitter",
        opts = {
          auto_install = true,
          highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
          },
        },
        config = function(_, opts)
          require("nvim-treesitter.configs").setup(opts)
        end,
      },
    },
    opts = {
      load = {
        ["core.defaults"] = {}, -- Loads default behavior
        ["core.concealer"] = {
          config = {
            { icon_preset = "diamond" }
          },
        }, -- Adds pretty icons to your documents
        ["core.keybinds"] = {
          -- https://github.com/nvim-neorg/neorg/blob/main/lua/neorg/modules/core/keybinds/keybinds
          config = {
            default_keybindings = true,
            neorg_leader = "<Leader><Leader>",
          },
        }, -- Adds defaults keybindings
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
            name = "[Norg]"
          },
        }, -- Enables support for completion plugins
        ["core.ui"] = {},
        ["core.ui.calendar"] = {},
        ["core.journal"] = {},-- Enables journal module
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
  {
    "hrsh7th/cmp-cmdline",
    keys = { ":", "/", "?" },
    dependencies = { "hrsh7th/nvim-cmp" },
    opts = function()
      local cmp = require "cmp"
      return {
        {
          type = "/",
          mapping = cmp.mapping.preset.cmdline(),
          sources = {
            { name = "buffer" },
          },
        },
        {
          type = ":",
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({
            { name = "path" },
          }, {
              {
                name = "cmdline",
                option = {
                  ignore_cmds = { "Man", "!" },
                },
              },
            }),
        },
      }
    end,
    config = function(_, opts)
      local cmp = require "cmp"
      vim.tbl_map(function(val) cmp.setup.cmdline(val.type, val) end, opts)
    end,
  },
}
