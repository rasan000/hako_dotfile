-- lua/plugins/lsp.lua
return
{
  {
    'neovim/nvim-lspconfig',
    config = function()
      vim.lsp.enable('lua_ls')
      vim.lsp.enable('ts_ls')
      vim.lsp.enable('yamlls')
      vim.lsp.enable('pyright')
  end
}
}
