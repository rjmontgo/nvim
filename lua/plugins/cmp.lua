return {
  "hrsh7th/nvim-cmp",
  lazy = false,
  priority = 100,
  dependencies = {
    "onsails/lspkind.nvim", -- symbols in the completion 'function' 'module' etc.
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
  },
  config = function()
    local cmp = require "cmp"
    cmp.setup {
      sources = {
        { name = "nvim_lsp" },
        { name = "minuet" },
        { name = "path" },
        { name = "buffer" }
      },
      performance = {
        fetching_timeout = 2000,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-y>"] = cmp.mapping.confirm({ select = true })
      }),
    }
  end
}
