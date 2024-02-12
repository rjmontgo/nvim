local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ls', builtin.find_files, {})
vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>lf', builtin.git_files, {})
vim.keymap.set('n', '<leader>lb', builtin.buffers, {})
