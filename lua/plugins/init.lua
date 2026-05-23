return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

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
      },
    },
  },

  {
    "nvim-neotest/nvim-nio",
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },

  {
    "mfussenegger/nvim-dap",
    ft = "python",
    keys = {
      { "<leader>db", ":DapToggleBreakpoint<CR>", desc = "Toggle Break Point", ft = "python" },
    },
  },

  {
    "mfussenegger/nvim-dap-python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end,
    keys = {
      {
        "<leader>dPt",
        function()
          require("dap-python").test_method()
        end,
        desc = "Debug Method",
        ft = "python",
      },
      {
        "<leader>dPc",
        function()
          require("dap-python").test_class()
        end,
        desc = "Debug Class",
        ft = "python",
      },
    },
  },

  {
    "ymtec90/ChatOllama.nvim",
    event = "VeryLazy",
    config = function()
      require("chatollama").setup {
        -- Ollama specific parameters
        predefined_chat_gpt_prompts = "file://" .. vim.fn.expand "~/.config/chatollama_prompts.csv",
        openai_params = {
          -- NOTE: model can be a function returning the model name
          -- Example:
          -- model = function()
          --     if some_condition() then
          --         return "llama3"
          --     else
          --         return "qwen2.5-coder:7b"
          --     end
          -- end,
          model = "qwen2.5-coder:1.5b",
          frequency_penalty = 0,
          presence_penalty = 0,
          max_tokens = 4095,
          temperature = 0.2,
          top_p = 0.1,
          n = 1,
        },
      }
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim", -- optional
      "nvim-telescope/telescope.nvim",
    },
  },

  {
    "ymtec90/pm-agent.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    cmd = {
      "PMAgent",
      "PMReview",
      "PMAdd",
      "PMBasket",
      "PMProject",
      "PMAction",
    },
    config = function()
      require("pm_agent").setup {
        -- URL local do seu Ollama
        ollama_url = "http://localhost:11434/api/chat",
        -- Defina seu modelo preferido
        model = "qwen2.5-coder:1.5b",
      }
    end,
  },
}
