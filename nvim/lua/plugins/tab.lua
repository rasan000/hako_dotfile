return {

  --barbar
  {
    "romgrk/barbar.nvim",
    config = function()
      require("barbar").setup({
        auto_hide = true,
      })
      vim.api.nvim_set_keymap("n", "gt", "<cmd>BufferNext<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "gT", "<cmd>BufferPrevious<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>br", "<cmd>BufferRestore<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>e", "<Cmd>BufferClose!<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>bp", "<Cmd>BufferPin<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<C-1>", "<Cmd>BufferGoto 1<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<C-2>", "<Cmd>BufferGoto 2<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<C-3>", "<Cmd>BufferGoto 3<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<C-4>", "<Cmd>BufferGoto 4<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<C-5>", "<Cmd>BufferGoto 5<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<C-6>", "<Cmd>BufferGoto 6<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<C-7>", "<Cmd>BufferGoto 7<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<C-8>", "<Cmd>BufferGoto 8<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<C-9>", "<Cmd>BufferGoto 9<CR>", { noremap = true, silent = true })
    end,
  },
}
