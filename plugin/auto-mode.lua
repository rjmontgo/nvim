-- disable treesitter on vim doc / help
vim.api.nvim_create_autocmd('FileType', {
  desc = "Disable treesitter on vim doc since tags/links don't work properly",
  pattern = "help",
  callback = function()
    vim.cmd([[TSBufDisable highlight]])
  end
})
