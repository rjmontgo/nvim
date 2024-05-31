local oil = require("oil")
local actions = require("oil.actions")
oil.setup({
  view_options = {
    show_hidden = true,
  },
  columns = {
    "icon",
    "permissions",
    --"size",
    --"mtime"
  }
})

local keymap = vim.keymap.set

keymap("n", "<leader>e", ":Oil<CR>", { noremap = true })
keymap("n", "<leader>ne", function () oil.open("~/.config/nvim") vim.cmd("cd ~/.config/nvim") end)
