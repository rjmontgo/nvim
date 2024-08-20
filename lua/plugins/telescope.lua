return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  config = function()
    local set = vim.keymap.set
    local builtin = require('telescope.builtin')
    set('n', '<leader>ls', builtin.find_files, {})
    set('n', '<leader>lg', builtin.live_grep, {})
    set('n', '<leader>pf', builtin.git_files, {})
    set('n', '<leader>b', builtin.buffers, {})

    set('n', '<leader>v', function()
      local windows = vim.api.nvim_list_wins()
      if #windows > 1 then
        local firstWindow = vim.api.nvim_list_wins()[1]
        vim.api.nvim_set_current_win(firstWindow)
        vim.cmd [[only]]
        return
      end
      vim.cmd([[vsplit]])
      builtin.find_files()
    end, {})
  end
}
