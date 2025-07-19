return {
  -- git signs
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },
  --git blame
  {
    'f-person/git-blame.nvim',
    config = function()
      vim.api.nvim_set_keymap('n', '<leader>gb', '<Cmd>GitBlameToggle<CR>', {})
    end
  },

  --chat
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },       -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" },        -- for curl, log wrapper
    },
    config = function()
      require("CopilotChat").setup({
        debug = true,       -- Enable debugging
        -- See Configuration section for rest
      })
      vim.api.nvim_set_keymap('n', '<leader>cc', '<Cmd>CopilotChatToggle<CR>', {})
    end
  },

  --copilot
  {
    'github/copilot.vim',
    config = function()
      vim.api.nvim_set_keymap("i", "<C-]>", "<Plug>(copilot-next)", { silent = true })
      vim.api.nvim_set_keymap("i", "<C-[>", "<Plug>(copilot-previous)", { silent = true })
    end
  },
}
