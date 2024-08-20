local set = vim.keymap.set

-- cd to notes
set("n", "<leader>n", function()
  vim.cmd([[cd ~/notes]])
  vim.cmd([[edit ~/notes]])
end)

-- cd to nvim directory
set("n", "<leader>m", function()
  vim.cmd([[cd ~/.config/nvim]])
  vim.cmd([[edit ~/.config/nvim]])
end)
