require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")
map("n", "<leader>hl", "<cmd>nohlsearch<cmd>", { desc = "Stop highlight search" })
map("n", "o", "o<ESC>", { desc = "Insert line below" })
map("n", "O", "O<ESC>", { desc = "Insert line above" })
map("n", "Y", "y$", { desc = "Yank the rest of the line" })
map("n", "n", "nzz", { desc = "Next occurrency" })
map("n", "N", "Nzz", { desc = "Previous occurency" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
map("n", "<Up>", "", { desc = "Disable up arrow key" })
map("n", "<Down>", "", { desc = "Disable down arrow key" })
map("n", "<Right>", "", { desc = "Disable right arrow key" })
map("n", "<Left>", "", { desc = "Disable left arrow key" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
