return {
  {
    "catppuccin/nvim",
    config = function()
      require('catppuccin').setup {
        custom_highlights = function()
          return {
            -- fixes for the floats :_) so they actually don't look silly
            NormalFloat = { bg = "NONE" },
            FloatBorder = { fg = "#cfd3dd" }
          }
        end
      }

      vim.cmd.colorscheme "catppuccin"
    end,
  },
}
