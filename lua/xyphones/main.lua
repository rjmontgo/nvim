local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },
  'ixru/nvim-markdown',
  'williamboman/mason.nvim',
  'github/copilot.vim',
  'rebelot/kanagawa.nvim',
  {
    'numToStr/Comment.nvim',
    lazy = false,
  },

  'jose-elias-alvarez/null-ls.nvim',

  'L3MON4D3/LuaSnip',

  'nvim-treesitter/nvim-treesitter',
  'nvim-treesitter/playground',
  'nvim-treesitter/nvim-treesitter-context',

  'neovim/nvim-lspconfig',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',

  'tpope/vim-fugitive',
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
  },

  {
    'ThePrimeagen/harpoon',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
  },

  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'leoluz/nvim-dap-go',
      'rcarriga/nvim-dap-ui',
      'nvim-telescope/telescope-dap.nvim',
    },
  }
})
