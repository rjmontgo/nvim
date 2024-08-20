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
  backup = false, -- do not create a backup file
  undodir = os.getenv("XDG_CACHE_HOME") .. "/vim/undodir",
  undofile = true,
  hlsearch = false,
  incsearch = true,
  termguicolors = true,
  scrolloff = 8,
  signcolumn = "yes",

  clipboard = "unnamedplus", -- use system clipboard
  cmdheight = 1,
  completeopt = { "menuone", "noselect" },
  conceallevel = 0,
  ignorecase = true,
  sidescrolloff = 8,
  splitbelow = true,
  splitright = true,
  updatetime = 300,
  numberwidth = 3,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.isfname:append("@-@")
