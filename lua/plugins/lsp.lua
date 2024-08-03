return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "stevearc/conform.nvim"
    },
    config = function()
      local lspconfig = require "lspconfig"

      local capabilities = nil
      if pcall(require, "cmp_nvim_lsp") then
        capabilities = require("cmp_nvim_lsp").default_capabilities()
      end

      local servers = {
        bashls = true,
        tsserver = true,
        lua_ls = {
          on_init = function(client)
            local path = client.workspace_folders[1].name
            if vim.uv.fs_stat(path .. '.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
              return
            end

            client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
              runtime = {
                version = 'LuaJIT'
              },
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.env.VIMRUNTIME
                }
              },
            })
          end,
          settings = {
            Lua = {}
          }
        }
      }

      for name, config in pairs(servers) do
        if config == true then
          config = {}
        end

        config = vim.tbl_deep_extend("force", {}, {
          capabilities = capabilities,
        }, config)

        lspconfig[name].setup(config)
      end

      require("mason").setup()


      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf };
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)

          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

          vim.keymap.set("n", "<leader>f", function()
            vim.lsp.buf.format({ async = true })
          end, opts)
        end
      })

      -- autoformatting on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function(args)
          require("conform").format {
            bufnr = args.buf,
            lsp_fallback = true,
            quiet = true,
          }
        end
      })
    end,
  }
}
