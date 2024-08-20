return {
  "ThePrimeagen/harpoon",
  config = function()
    local harpoon = require('harpoon')
    harpoon.setup()
    local mark = require('harpoon.mark')
    local ui = require('harpoon.ui')
    local set = vim.keymap.set

    set('n', '<leader>a', mark.add_file)
    set('n', '<C-e>', ui.toggle_quick_menu)
    set('n', '[a', ui.nav_prev)
    set('n', ']a', ui.nav_next)
    for _, idx in ipairs { 1, 2, 3, 4, 5 } do
      set('n', string.format("<leader>%d", idx), function()
        ui.nav_file(idx)
      end)
    end
  end

}
