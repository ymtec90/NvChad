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
        api_key_cmd = "pass show openai",
      }
    end,
  },
  {
    "Zeioth/compiler.nvim",
    dependencies = {
      {
        "stevearc/overseer.nvim",
        config = function(_, opts)
          require("overseer").setup(opts)
        end,
      },
      {
        "nvim-telescope/telescope.nvim",
      },
    },
    cmd = {
      "CompilerOpen",
      "CompilerToggleResults",
      "CompilerRedo",
    },
    opts = {},
    keys = {
      { "<leader>co", "<cmd>CompilerOpen<CR>", desc = "Open Compiler" },
      { "<leader>cr", "<cmd>CompilerStop<CR>" .. "<cmd>CompilerRedo<CR>", desc = "Redo Last Selection Option" },
      { "<leader>ct", "<cmd>CompilerToggleResults<CR>", desc = "Toggle Compiler Results" },
    },
  },
  {
    "stevearc/overseer.nvim",
    cmd = {
      "OverseerOpen",
      "OverseerClose",
      "OverseerToggle",
      "OverseerSaveBundle",
      "OverseerLoadBundle",
      "OverseerDeleteBundle",
      "OverseerRunCmd",
      "OverseerRun",
      "OverseerInfo",
      "OverseerBuild",
      "OverseerQuickAction",
      "OverseerTaskAction ",
      "OverseerClearCache",
    },
    opts = {
      dap = false,
      task_list = { -- this refers to the window that shows the result
        direction = "bottom",
        min_height = 25,
        max_height = 25,
        default_detail = 1,
        bindings = {
          ["q"] = function()
            vim.cmd "OverseerClose"
          end,
          ["<C-h>"] = false,
          ["<C-j>"] = false,
          ["<C-k>"] = false,
          ["<C-l>"] = false,
        },
        form = {
          win_opts = {
            winblend = 0,
          },
        },
        confirm = {
          win_opts = {
            winblend = 0,
          },
        },
        task_win = {
          win_opts = {
            winblend = 0,
          },
        },
      },
    },
    keys = {
      { "<leader>ow", "<cmd>OverseerToggle<CR>", desc = "Task list" },
      { "<leader>oo", "<cmd>OverseerRun<CR>", desc = "Run task" },
      { "<leader>oq", "<cmd>OverseerQuickAction<CR>", desc = "Action recent task" },
      { "<leader>oi", "<cmd>OverseerInfo<CR>", desc = "Overseer Info" },
      { "<leader>ob", "<cmd>OverseerBuild<CR>", desc = "Task builder" },
      { "<leader>ot", "<cmd>OverseerTaskAction<CR>", desc = "Task action" },
      { "<leader>oc", "<cmd>OverseerClearCache<CR>", desc = "Clear cache" },
    },
  },
}
