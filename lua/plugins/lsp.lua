return {
  ---------------------------------------------------------------------------
  -- Mason: installs LSP servers / formatters / debuggers
  ---------------------------------------------------------------------------
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  ---------------------------------------------------------------------------
  -- Mason-LSPConfig + native vim.lsp.config API
  ---------------------------------------------------------------------------
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig", 
    },
    config = function()
      local mlsp = require("mason-lspconfig")

      -----------------------------------------------------------------------
      -- Global diagnostics config (all LSPs)
      -----------------------------------------------------------------------
      vim.diagnostic.config({
        virtual_text = {
          prefix = "●",
          spacing = 2,
        },
        signs = true,
        underline = true,
        update_in_insert = true,
        severity_sort = true,
        float = {
          border = "rounded",
          source = "if_many",
        },
      })

      -----------------------------------------------------------------------
      -- Shared on_attach (all servers use this)
      -----------------------------------------------------------------------
      local on_attach = function(client, bufnr)
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        map("n", "K", vim.lsp.buf.hover, "Hover documentation")
        map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
        map("n", "<leader>ca", vim.lsp.buf.code_action, "Code actions")

        map("n", "<leader>e", vim.diagnostic.open_float, "Line diagnostics")
        map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
        map("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")

        if client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end

        if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
          local ok = pcall(function()
            vim.lsp.inlay_hint(bufnr, true)
          end)
          if not ok then
            pcall(function()
              vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
            end)
          end
        end
      end

      -----------------------------------------------------------------------
      -- Per-server extra options (data, no ifs)
      -----------------------------------------------------------------------
      local servers = {
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              cargo = { allFeatures = true },
              checkOnSave = { command = "clippy" },
              inlayHints = {
                bindingModeHints = { enable = false },
              },
              rustfmt = {
                enable = true
              }
            },
          },
        },

        lua_ls = {
          settings = {
            Lua = {
               diagnostics = { globals = { "vim" } },
             },
           },
         },
      }

      vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function(args)
          local bufnr = args.buf

          -- Get all LSP clients attached to this buffer
          local clients = vim.lsp.get_clients({ bufnr = bufnr })
          if not clients or #clients == 0 then
            return
          end

          -- Check if any client supports formatting
          local has_formatter = false
          for _, client in ipairs(clients) do
            if client.server_capabilities
              and client.server_capabilities.documentFormattingProvider
            then
              has_formatter = true
              break
            end
          end

          if not has_formatter then
            return
          end

          vim.lsp.buf.format({
            bufnr = bufnr,
            async = false,
          })
        end,
      })

      -----------------------------------------------------------------------
      -- Mason-LSPConfig: install & start servers via vim.lsp.config
      -----------------------------------------------------------------------
      mlsp.setup({
        ensure_installed = vim.tbl_keys(servers), -- all keys in servers table
        automatic_installation = true,

        handlers = {
          function(server_name)
            -- base config from nvim-lspconfig, new API style
            local config = vim.lsp.config[server_name]()
            if not config then
              -- in case some server is not defined by nvim-lspconfig
              return
            end

            config.on_attach = on_attach

            local extra = servers[server_name]
            if extra then
              config = vim.tbl_deep_extend("force", config, extra)
            end

            vim.lsp.start(config)
          end,
        },
      })
    end,
  },
}
