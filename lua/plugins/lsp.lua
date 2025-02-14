return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason.lspconfig.nvim",
      "stevearc/conform.nvim"
    },
    config = function() 
      local lsp = require "lspconfig"

      local cmp_capabilites = require "cmp_nvim_lsp".default_capabilities()

      local handlers = {
        ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
        ["textDocument/signature_help"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
      }

      vim.diagnostic.config {
        signs = true,
        underline = true,
        virtual_text = false,
        virtual_lines = false,
        update_in_insert = true,
        float = {
          header = '',
          border = 'rounded',
          focusable = true
        }
      }

      local servers = {
        vtsls = true,
        svelte = true
      }

      for name, config in pairs(servers) do
        if config == true then
          config = {}
        end
        lsp[name].setup(config)
      end

      -- setup mason right after setting up servers
      require("mason").setup()

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf };
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<C-h>", vim.lsp.buf.signature_help, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

          vim.keymap.set({ "n", "v" }, "<leader>aa", vim.lsp.buf.code_action, opts)
        end
      })

      vim.keymap.set("n", "[d", function()
        vim.diagnostic.goto_prev({ open_float = true })
      end)

      vim.keymap.set("n", "]d", function()
        vim.diagnostic.goto_next({ open_float = true })
      end)

      local conform = require "conform"
      conform.setup {
        formatters_by_ft = {
          javascript = { 'prettierd' },
          typescript = { 'prettierd' },
          typescriptreact = { 'prettierd' },
          svelte = { 'prettierd' }
        }
      }

      vim.keymap.set("n", "<leader>f", function()
        conform.format()
      end)

    end
  }
}
