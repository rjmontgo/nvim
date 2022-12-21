local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function ()
  builtin.grep_string({ search = vim.fn.input("grep > ") });
end, {})

require('telescope').setup{
  defaults = {
    path_display = {
      truncate = true;
    },
    mappings = {
      n = {
        ["<C-s>"] = actions.send_selected_to_qflist + actions.open_qflist,
      }
    }
  }
}
