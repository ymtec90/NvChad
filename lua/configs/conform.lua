local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    python = {
      "black",
      "isort",
    },
    javascript = {
      "prettier",
      "eslint",
    },
    typescript = {
      "prettier",
      "eslint",
    },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 2000,
    lsp_fallback = true,
  },
}

return options
