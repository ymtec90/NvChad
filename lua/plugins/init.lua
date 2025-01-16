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
    "zk-org/zk-nvim",
    cmd = {
      "ZkIndex",
      "ZkNew",
      "ZkNewFromTitleSelection",
      "ZkNewFromContentSelection",
      "ZkCd",
      "ZkNotes",
      "ZkBuffers",
      "ZkBacklinks",
      "ZkLinks",
      "ZkInsertLink",
      "ZkInsertLinkAtSelection",
      "ZkMatch",
      "ZkTags",
    },
    config = function()
      require("zk").setup {
        picker = "telescope",
      }
    end,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "BufEnter",
  },
}
