return {

  --comment
  {
    'echasnovski/mini.comment',
    config = function()
      require('mini.comment').setup({})
    end
  },

  --easy motion
  {
    'easymotion/vim-easymotion',
    config = function()
      -- Basic settings
      vim.g.EasyMotion_do_mapping = 0 -- Disable default mappings 
      vim.g.EasyMotion_smartcase = 1  -- Turn on case-insensitive feature
      vim.g.EasyMotion_starofline = 0  -- Turn on case-insensitive feature
      
      -- Keymappings
      vim.api.nvim_set_keymap('n', 'f', '<Plug>(easymotion-sl)', {}) -- line search (bidirectional)
      vim.api.nvim_set_keymap('n', 's', '<Plug>(easymotion-overwin-f)', {}) -- all screen search
      vim.api.nvim_set_keymap('n', '<leader>s', '<Plug>(easymotion-s2)', {}) -- 2-char search
      vim.api.nvim_set_keymap('n', '<leader>/', '<Plug>(easymotion-sn)', {}) -- search + easymotion
    end
  },
  --nvim-surround
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  --nvim-autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true,
        ts_config = {
          lua = { "string" },
          javascript = { "template_string" },
          java = false,
        },
      })
    end
  },
}
