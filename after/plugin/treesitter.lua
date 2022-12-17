require'nvim-treesitter.configs'.setup {
  ensure_installed = { "help", "javascript", "typescript", "tsx", "lua" },

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,

    additional_vim_regex_highlighting = true,
  },

  indent = { enable = true }

}

-- colors the attributes for a jsx tag different than the attribute itself so it isn't all green
-- did this by using :TSHighlightCapturesUnderCursor to determine that the tree sitter capture group
-- was "@tag.attribute" then used other elements to determine what capture group is linked to a color. 
-- In this case it was blue.
vim.api.nvim_set_hl(0, "@tag.attribute", { link = "Blue" })

