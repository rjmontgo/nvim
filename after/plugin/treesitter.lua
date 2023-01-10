require'nvim-treesitter.configs'.setup {
  ensure_installed = { "help", "javascript", "typescript", "tsx", "lua" },
  
  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,

    additional_vim_regex_highlighting = true,
  },
  autopairs= {
    enable = true,
  },

  indent = { enable = true }

}
