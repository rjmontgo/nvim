local opts = { remap = false, silent = true }

local keymap = vim.keymap.set;


vim.g.mapleader = " "

--- Normal Mode ---
-- resize windows easily
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)


--- File Navigation
keymap("n", "<leader>e", vim.cmd.Ex)
keymap("n", "<leader><CR>", ":so ~/.config/nvim/init.lua<CR>")
keymap("n", "<leader>f", vim.lsp.buf.format)

