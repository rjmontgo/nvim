local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ls', builtin.find_files, {})
vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>pf', builtin.git_files, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
