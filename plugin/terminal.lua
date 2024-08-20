local opt = vim.opt_local

vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", {}),
  callback = function()
    opt.number = false
    opt.relativenumber = false
    opt.scrolloff = 0
  end
})

vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
