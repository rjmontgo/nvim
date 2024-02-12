local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  vim.notify("[02-treesitter.lua] could not require nvim-treesitter.configs")
end

treesitter.setup({
  ensure_installed = {
    "typescript",
    "javascript",
    "tsx",
    "go",
    "java"
  },

  auto_install = true,
  highlight = {
    enable = true,
  }

})
