local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

local keymap = vim.keymap.set

keymap("n", "<leader>a", mark.add_file)
keymap("n", "<C-e>", ui.toggle_quick_menu)

