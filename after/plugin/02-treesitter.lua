local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  vim.notify("[02-treesitter.lua] could not require nvim-treesitter.configs")
end

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

parser_config.gotmpl = {
  install_info = {
    url = "https://github.com/ngalaiko/tree-sitter-go-template",
    files = { "src/parser.c" }
  },
  filetype = "gotmpl",
  used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl" }
}

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
