local status_ok, lspconfig = pcall(require, "lspconfig");
if not status_ok then
  vim.notify("[03-lsp.lua] could not require lspconfig")
end

local luasnip = require("luasnip")

local capabilities = require("cmp_nvim_lsp").default_capabilities();
local servers = { "tsserver", "gopls", "lua_ls" };

for _, lsp in ipairs(servers) do
  if lsp == "lua_ls" then
    lspconfig["lua_ls"].setup {
      capabilitities = capabilities,
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
      capabilities = capabilities,
    }
  end
end

-- lsp actions
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

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
