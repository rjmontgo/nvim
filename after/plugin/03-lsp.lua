local status_ok, lspconfig = pcall(require, "lspconfig");
if not status_ok then
  vim.notify("[03-lsp.lua] could not require lspconfig")
end

local luasnip = require("luasnip")

local capabilities = require("cmp_nvim_lsp").default_capabilities();
local servers = { "tsserver", "gopls", "lua_ls", "emmet_language_server", "golangci_lint_ls" };

vim.cmd("hi NormalFloat guibg=#32302f")
vim.cmd("hi FloatBorder guifg=#f2e2c3 guibg=#32302f")

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
  ["textDocument/signature_help"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
}

for _, lsp in ipairs(servers) do
  if lsp == "lua_ls" then
    lspconfig["lua_ls"].setup {
      capabilitities = capabilities,
      handlers = handlers,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          }
        }
      }
    }
  else
    lspconfig[lsp].setup {
      handlers = handlers,
      capabilities = capabilities,
    }
  end
end

-- lsp actions
-- diagnostics

vim.diagnostic.config {
  signs = true,
  underline = true,
  virtual_text = false,
  virtual_lines = false,
  update_in_insert = true,
  float = {
    header = false,
    border = 'rounded',
    focusable = true
  }
}



vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev({ open_float = true }) end)
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next({ open_float = true }) end)


vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function (ev)
    local opts = { buffer = ev.buf };
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)

    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

    vim.keymap.set("n", "<leader>f", function ()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end
})


-- completions
local cmp = require("cmp")

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    -- default
    --["C-n"] = cmp.select_next_item,
    --["C-p"] = cmp.select_prev_item,
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = "nvim_lsp" },
  },
}


-- filetype fixes
vim.filetype.add({ extension = { mod = "gomod" } })
