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
    "ellisonleao/carbon-now.nvim",
    lazy = true,
    cmd = "CarbonNow",
    opts = {},
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
            { icon_preset = "diamond" },
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
            name = "[Norg]",
          },
        }, -- Enables support for completion plugins
        ["core.ui"] = {},
        ["core.ui.calendar"] = {},
        ["core.journal"] = {}, -- Enables journal module
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
      vim.tbl_map(function(val)
        cmp.setup.cmdline(val.type, val)
      end, opts)
    end,
  },
  {
    "nvim-neotest/nvim-nio",
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    opts = {},
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "theHamsta/nvim-dap-virtual-text",
      "mfussenegger/nvim-dap",
    },
    keys = {
      {
        "<leader>du",
        function()
          require("dapui").toggle {}
        end,
        desc = "DAP UI",
      },
      {
        "<leader>de",
        function()
          require("dapui").eval()
        end,
        desc = "Eval",
        mode = { "n", "v" },
      },
    },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.after.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.after.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "mfussenegger/nvim-dap",
    keys = {
      {
        "<leader>dB",
        function()
          require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
        end,
        desc = "Breakpoint Condition",
      },
      {
        "<leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
      },
      {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
        desc = "Run/Continue",
      },
      {
        "<leader>da",
        function()
          require("dap").continue { before = get_args }
        end,
        desc = "Run with Args",
      },
      {
        "<leader>dC",
        function()
          require("dap").run_to_cursor()
        end,
        desc = "Run to Cursor",
      },
      {
        "<leader>dg",
        function()
          require("dap").goto_()
        end,
        desc = "Go to Line (No Execute)",
      },
      {
        "<leader>di",
        function()
          require("dap").step_into()
        end,
        desc = "Step Into",
      },
      {
        "<leader>dj",
        function()
          require("dap").down()
        end,
        desc = "Down",
      },
      {
        "<leader>dk",
        function()
          require("dap").up()
        end,
        desc = "Up",
      },
      {
        "<leader>dl",
        function()
          require("dap").run_last()
        end,
        desc = "Run Last",
      },
      {
        "<leader>do",
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
      },
      {
        "<leader>dO",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },
      {
        "<leader>dP",
        function()
          require("dap").pause()
        end,
        desc = "Pause",
      },
      {
        "<leader>dr",
        function()
          require("dap").repl.toggle()
        end,
        desc = "Toggle REPL",
      },
      {
        "<leader>ds",
        function()
          require("dap").session()
        end,
        desc = "Session",
      },
      {
        "<leader>dt",
        function()
          require("dap").terminate()
        end,
        desc = "Terminate",
      },
      {
        "<leader>dw",
        function()
          require("dap.ui.widgets").hover()
        end,
        desc = "Widgets",
      },
    },
  },
  {
    "mfussenegger/nvim-dap-python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    ft = "python",
    config = function(_, opts)
      local path = (os.getenv "HOME" .. "/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
      require("dap-python").setup(path)
    end,
    keys = {
      {
        "<leader>dpr",
        function()
          require("dap-python").test_method()
        end,
        desc = "Debug Method",
      },
      {
        "<leader>dpc",
        function()
          require("dap-python").test_class()
        end,
        desc = "Debug Class",
      },
    },
  },
  {
    "MunifTanjim/nui.nvim",
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    dependecies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("chatgpt").setup {
        api_key_cmd = "echo $openai_key",
      }
    end,
  },
}
