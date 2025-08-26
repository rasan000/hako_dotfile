return
{
  'neovim/nvim-lspconfig',
  dependencies = { "saghen/blink.cmp" },
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("blink.cmp").get_lsp_capabilities({
      textDocument = {
        completion = {
          completionItem = {
            snippetSupport = true,
          }
        }
      },
      foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }
    })
    --lsp setup
    vim.lsp.enable({
      'lua_ls',
      'ts_ls',
      'yamlls',
      'pyright',
      'jsonls',
      'bashls'
    })


    -- LSP attach configuration (v0.11 style)
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local bufnr = ev.buf
        local client = vim.lsp.get_client_by_id(ev.data.client_id)

        -- Custom keymaps
        local opts = { buffer = bufnr, silent = true }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gf", vim.lsp.buf.format, opts)
        vim.keymap.set("n", "ge", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "g[", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "g]", vim.diagnostic.goto_next, opts)

        -- Auto show diagnostics on cursor hold
        vim.api.nvim_create_autocmd("CursorHold", {
          buffer = bufnr,
          callback = function()
            local diagnostic_opts = {
              focusable = false,
              close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
              border = "rounded",
              source = "always",
              prefix = " ",
              scope = "cursor",
            }
            vim.diagnostic.open_float(nil, diagnostic_opts)
          end,
        })
      end,
    })

    -- Configure diagnostics
    vim.diagnostic.config({
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = function(diagnostic)
          if diagnostic.severity == vim.diagnostic.severity.ERROR then
            return " "
          elseif diagnostic.severity == vim.diagnostic.severity.WARN then
            return " "
          elseif diagnostic.severity == vim.diagnostic.severity.INFO then
            return " "
          elseif diagnostic.severity == vim.diagnostic.severity.HINT then
            return ""
          end
        end,
      },
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })
  end
}
