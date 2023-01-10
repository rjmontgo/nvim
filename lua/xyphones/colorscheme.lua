vim.o.background = "dark"

local colorscheme = "gruvbox"

local status_ok, _ = pcall(require, colorscheme)
if not status_ok then
  vim.notify("Could not require: " .. colorscheme)
  colorscheme = "default"
end

require("gruvbox").setup({
  contrast = "soft",
})

local status_ok_set_colorscheme, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok_set_colorscheme then
  vim.notify("colorscheme: " .. colorscheme .. " not found!")
  return
end

vim.cmd.colorscheme('gruvbox')
vim.cmd([[highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=NONE guibg=NONE guifg=NONE]])
