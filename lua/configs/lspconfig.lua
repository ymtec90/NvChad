require("nvchad.configs.lspconfig").defaults()

-- Define as configurações específicas para o Lua ANTES de habilitá-lo
vim.lsp.config.lua_ls = {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

-- Adicionando suporte ao R
vim.lsp.config.r_languageserver = {
  settings = {
    filetypes = { "r", "rmd" },
  },
}

-- Lista de servidores que você quer ativar
local servers = {
  "html",
  "cssls",
  "basedpyright",
  "ts_ls",
  "emmet_ls",
  "lua_ls",
}

-- O NvChad injeta os mapeamentos e recursos (capabilities) nativamente aqui
vim.lsp.enable(servers)
