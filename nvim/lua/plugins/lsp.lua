return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim', config = true },
    {
      'williamboman/mason-lspconfig.nvim',
      opts = {
        ensure_installed = {
          'ts_ls',
          'tailwindcss',
          'gopls',
          'html',
          'pyright',
        },
      },
      config = function()
        require("mason-lspconfig").setup {
          automatic_enable = {
            exclude = {
              "ts_ls"
            }
          }
        }
      end
    },

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'saadparwaiz1/cmp_luasnip' },

    -- Snippets
    { 'L3MON4D3/LuaSnip' },
    { 'rafamadriz/friendly-snippets' },
  },

  config = function()
    local lsp = require("lsp-zero")
    lsp.extend_lspconfig()

    local cmp = require('cmp')
    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()

    cmp.setup({
      capabilities = cmp_capabilities,
      mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = nil,
        ['<S-Tab>'] = nil,
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
    })


    lsp.set_preferences({
      suggest_lsp_servers = false,
      sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
      }
    })

    vim.diagnostic.config({
      virtual_text = true,
    })

    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

    local lsp_format_on_save = function(bufnr)
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          local ok = pcall(vim.cmd, 'EslintFixAll')
          if not ok then
            vim.lsp.buf.format({ async = false })
          end
        end,
      })
    end

    local util = require("lspconfig.util")

    require("lspconfig").ts_ls.setup({
      root_dir = util.root_pattern('tsconfig.json'),
    })

    lsp.on_attach(function(client, bufnr)
      local opts = { buffer = bufnr, remap = false }
      local map = vim.keymap.set

      map("n", "gd", function() vim.lsp.buf.definition() end, opts)
      map("n", "K", function() vim.lsp.buf.hover() end, opts)
      map("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
      map("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
      map("n", "[d", function() vim.diagnostic.goto_next() end, opts)
      map("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
      map("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
      map("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
      map("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
      map("n", "gl", function() vim.lsp.buf.rename() end, opts)
      map("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

      -- Optional per-language hooks
      if client.name == "ts_ls" then
        lsp_format_on_save(bufnr)
      end

      if client.name == "gopls" then
        vim.api.nvim_create_autocmd("BufWritePre", {
          pattern = "*.go",
          group = augroup,
          callback = function()
            local params = vim.lsp.util.make_range_params()
            params.context = { only = { "source.organizeImports" } }
            local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
            for _, res in pairs(result or {}) do
              for _, r in pairs(res.result or {}) do
                if r.edit then
                  local enc = (client or {}).offset_encoding or "utf-16"
                  vim.lsp.util.apply_workspace_edit(r.edit, enc)
                end
              end
            end
            vim.lsp.buf.format({ async = false })
          end,
        })
      end
    end)

    lsp.setup()
  end,
}
