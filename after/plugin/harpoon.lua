local harpoon_mark = require('harpoon.mark')
local harpoon_ui = require('harpoon.ui')

vim.keymap.set("n", "ma", function() harpoon_mark.add_file() end)
vim.keymap.set("n", "mm", function() harpoon_ui.toggle_quick_menu() end)
vim.keymap.set("n", "mn", function() harpoon_ui.nav_next() end)
vim.keymap.set("n", "mp", function() harpoon_ui.nav_prev() end)
