-- lua/plugins/lsp.lua
return
{
    'neovim/nvim-lspconfig',
    dependencies = {"saghen/blink.cmp"},
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
          dynamicRefistration = false,
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
  end
}
