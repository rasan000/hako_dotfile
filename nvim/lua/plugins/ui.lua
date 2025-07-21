return {
  --visuals
  --float command and messages
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        cmdline = {
          enabled = true,
          view = "cmdline_popup", -- Use floating popup for command line
          opts = {
            position = {
              row = "50%",
              col = "50%",
            },
            size = {
              width = 60,
              height = "auto",
            },
            border = {
              style = "rounded",
              padding = { 0, 1 },
            },
            win_options = {
              winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
            },
          },
        },
        popupmenu = {
          enabled = true,
          backend = "nui", -- Use nui backend for popup menu
          kind_icons = {},
        },
        messages = {
          enabled = true,
          view = "notify", -- Use notifications for messages
          view_error = "notify",
          view_warn = "notify",
          view_history = "messages",
          view_search = "virtualtext",
        },
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
          hover = {
            enabled = true,
            silent = false,
            view = nil,
            opts = {},
          },
          signature = {
            enabled = true,
            auto_open = {
              enabled = true,
              trigger = true,
              luasnip = true,
              throttle = 50,
            },
            view = nil,
            opts = {},
          },
          message = {
            enabled = true,
            view = "notify",
            opts = {},
          },
          documentation = {
            view = "hover",
            opts = {
              lang = "markdown",
              replace = true,
              render = "plain",
              format = { "{message}" },
              win_options = { concealcursor = "n", conceallevel = 3 },
            },
          },
        },
        presets = {
          bottom_search = true,         -- Use classic bottom search
          command_palette = true,       -- Position the cmdline and popupmenu together
          long_message_to_split = true, -- Long messages will be sent to a split
          inc_rename = false,           -- Enables an input dialog for inc-rename.nvim
          lsp_doc_border = false,       -- Add a border to hover docs and signature help
        },
        views = {
          cmdline_popup = {
            position = {
              row = "50%",
              col = "50%",
            },
            size = {
              width = 60,
              height = "auto",
            },
            border = {
              style = "rounded",
              padding = { 0, 1 },
            },
          },
          popupmenu = {
            relative = "editor",
            position = {
              row = "auto",
              col = "auto",
            },
            size = {
              width = 60,
              height = 10,
            },
            border = {
              style = "rounded",
              padding = { 0, 1 },
            },
            win_options = {
              winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
            },
          },
        },
      })

      -- Configure nvim-notify for better floating notifications
      require("notify").setup({
        background_colour = "#000000",
        timeout = 3000,
        top_down = false,
        render = "compact",
        stages = "fade_in_slide_out",
        minimum_width = 50,
        maximum_width = 80,
      })

      -- message history
      vim.keymap.set("n", "<leader>nl", "<cmd>Noice last<CR>")
      vim.keymap.set("n", "<leader>nh", "<cmd>Noice history<CR>")
      vim.keymap.set("n", "<leader>nd", "<cmd>Noice dismiss<CR>")
    end,
  }, {
  'lukas-reineke/indent-blankline.nvim',
  main = "ibl",
  config = function()
    require("ibl").setup({
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = {
        enabled = true,
        show_start = true,
        show_end = false,
      },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    })
  end
},


  --terminal
  {
    'akinsho/toggleterm.nvim',
    config = function()
      require('toggleterm').setup({
        size = 30,
        open_mapping = [[<c-t>]],
        kirection = 'horizontal',
      })
      vim.api.nvim_create_user_command('Term', function() require('toggleterm').toggle() end, {})
      local opts = { noremap = true, silent = true }

      vim.api.nvim_set_keymap('t', '<esc>', [[<C-\><C-n>]], opts)
    end
  },

  --nvim-scrollbar
  {
    "petertriho/nvim-scrollbar",
    event = "VeryLazy",
    config = function()
      require("scrollbar").setup({
        handlers = {
          search = true,
          gitsigns = true,
          diagnostics = true,
        },
        excluded_filetypes = { "cmp_menu", "cmp_docs", "TelescopePrompt" },
      })
    end
  },
}
