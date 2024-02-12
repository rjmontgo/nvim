local null_ls = require("null-ls")

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.gofmt
  }
}

-- format current buffer
vim.keymap.set('n', "<leader>f", function () vim.lsp.buf.format() end, {})
