local opts = { silent = true, remap = true }

local keymap = vim.keymap.set

vim.g.mapleader = " "

keymap("n", "<leader>e", vim.cmd.Ex)
keymap("n", "]b", vim.cmd.bnext)
keymap("n", "[b", vim.cmd.bprev)
keymap("n", "<leader>ne", function () vim.cmd.edit("~/.config/nvim") vim.cmd'cd %' end)
