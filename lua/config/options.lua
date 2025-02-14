local options = {
  number = true,
  relativenumber = true,
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  smartindent = true,
  wrap = false,
  swapfile = false,
  backup = false,
  undodir = os.getenv("XDG_CACHE_HOME") .. "/vim/undodir",
  undofile = false,
  hlsearch = false,
  incsearch = true,
  ignorecase = true,
  termguicolors = true,
  scrolloff = 8,
  signcolumn = "yes",
  clipboard = "unnamedplus",
  cmdheight = 1,
  completeopt = { "menuone", "noselect" },
  sidescrolloff = 8,
  showtabline = 0,
  splitbelow = true,
  splitright = true,
  numberwidth = 3,
  cursorline = false,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.isfname:append("@-@")
