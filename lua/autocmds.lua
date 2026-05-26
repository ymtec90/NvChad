require "nvchad.autocmds"

-- Cria o grupo de autocomandos de forma segura
local numbertoggle = vim.api.nvim_create_augroup("numbertoggle", { clear = true })

-- Ativa números relativos ao entrar no buffer, ganhar foco ou sair do modo insert
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
  group = numbertoggle,
  pattern = "*",
  callback = function()
    if vim.o.number and vim.api.nvim_get_mode().mode ~= "i" then
      vim.o.relativenumber = true
    end
  end,
})

-- Desativa números relativos ao sair do buffer, perder foco ou entrar no modo insert
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
  group = numbertoggle,
  pattern = "*",
  callback = function()
    if vim.o.number then
      vim.o.relativenumber = false
    end
  end,
})
