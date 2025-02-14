return {
  "nvim-treesitter/nvim-treesitter",
  config = function ()
    local treesitter = require "nvim-treesitter.configs"
    treesitter.setup({
      highlight = {
        enable = true
      },
    })
  end
}
