local colorscheme = "kanagawa";
local status_ok, _ = pcall(require, "kanagawa");

if not status_ok then
  vim.notify("[after/01-colorscheme.lua] Could not require colorscheme " .. colorscheme);
  colorscheme = "default"
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("[after/01-colorscheme.lua] Could not require colorscheme " .. colorscheme);
end

-- color fixes
vim.api.nvim_set_hl(0, "netrwDir", { link = "@text" })
