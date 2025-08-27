return {
  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local actions = require("telescope.actions")

      require("telescope").setup({
        defaults = {
          file_ignore_patterns = { "node_modules", ".git" },
          mappings = {
            n = {
              ["<C-a>"] = actions.send_to_qflist + actions.open_qflist,
            },
            i = {
              ["<C-a>"] = actions.send_to_qflist + actions.open_qflist,
            },
          },
        },
        sorting_strategy = "ascending",
        winblend = 4,
        layout_strategy = "vertical",
        layout_config = {
          height = 0.9,
          prompt_position = "top",
        },
        extensions = {
          coc = {
            prefer_locations = false,
          },
        },
      })
      vim.api.nvim_set_keymap(
        "n",
        "<leader>ff",
        "<cmd>Telescope find_files<CR>",
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>fg",
        "<cmd>Telescope live_grep <CR>",
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap(
        "n",
        "<leader>fh",
        "<cmd>Telescope help_tags<CR>",
        { noremap = true, silent = true }
      )
    end,
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require("telescope").load_extension("frecency")
    end,
  },
  {
    "BurntSushi/ripgrep",
  },

  -- telescope option
  {
    "danielfalk/smart-open.nvim",
    branch = "0.2.x",
    config = function()
      require("telescope").load_extension("smart_open")
    end,
    dependencies = {
      "kkharji/sqlite.lua",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-fzy-native.nvim" },
    },
  }
}
