return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  config = function()
    require('telescope').setup()

    local set = vim.keymap.set
    local builtin = require('telescope.builtin')
    set('n', '<leader>ls', builtin.find_files, {})
    set('n', '<leader>lg', builtin.live_grep, {})
    set('n', '<leader>ff', builtin.git_files, {})
    set('n', '<leader>b', builtin.buffers, {})
  end
}
