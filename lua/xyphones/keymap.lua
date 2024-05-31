local opts = { silent = true, remap = true }

local keymap = vim.keymap.set

vim.g.mapleader = " "

keymap("n", "]b", vim.cmd.bnext)
keymap("n", "[b", vim.cmd.bprev)
