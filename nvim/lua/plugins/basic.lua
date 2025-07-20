return {
  --trouble
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Troubme)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },

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
          bottom_search = true, -- Use classic bottom search
          command_palette = true, -- Position the cmdline and popupmenu together
          long_message_to_split = true, -- Long messages will be sent to a split
          inc_rename = false, -- Enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- Add a border to hover docs and signature help
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
  },

  --comment
  {
    'echasnovski/mini.comment',
    config = function()
      require('mini.comment').setup({
        mappings = {
          comment_visual = '<C-/>', -- Toggle comment for visual selection
          comment_line = '<C-/>', -- Toggle comment for visual selection
        }
      })
    end
  },

  --terminal
  {
    'akinsho/toggleterm.nvim',
    config = function()
      require('toggleterm').setup({
        size = 20,
        winblend = 15,
        open_mapping = [[<c-t>]],
        kirection = 'horizontal',
      })
      vim.api.nvim_create_user_command('Term', function() require('toggleterm').toggle() end, {})
      local opts = { noremap = true, silent = true }

      vim.api.nvim_set_keymap('t', '<esc>', [[<C-\><C-n>]], opts)
    end
  },

  --color scheme
  {
    'EdenEast/nightfox.nvim',
    config = function()
      require('nightfox').setup({
        options = {
          transparent = true,
          styles = {
            comments = 'italic',
            keywords = 'bold',
            type = 'italic,bold'
          },
        }
      })
      vim.cmd('colorscheme nordfox')
    end
  },

  -- nvim-web-devicons (use basic ASCII icons for compatibility)
  {
    'nvim-tree/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons').setup({
        override = {
          zsh = {
            icon = "Z",
            color = "#428850",
            cterm_color = "65",
            name = "Zsh"
          },
          lua = {
            icon = "L",
            color = "#51a0cf",
            cterm_color = "74",
            name = "Lua"
          },
          js = {
            icon = "J",
            color = "#cbcb41",
            cterm_color = "185",
            name = "Js"
          },
          ts = {
            icon = "T",
            color = "#519aba",
            cterm_color = "67",
            name = "Ts"
          },
          md = {
            icon = "M",
            color = "#519aba",
            cterm_color = "67",
            name = "Markdown"
          },
          txt = {
            icon = "F",
            color = "#89e051",
            cterm_color = "113",
            name = "Text"
          },
          py = {
            icon = "P",
            color = "#3572A5",
            cterm_color = "61",
            name = "Python"
          },
          vim = {
            icon = "V",
            color = "#019833",
            cterm_color = "28",
            name = "Vim"
          },
        },
        color_icons = true,
        default = true,
        strict = false,
        override_by_filename = {
          [".gitignore"] = {
            icon = "G",
            color = "#f1502f",
            name = "Gitignore"
          },
          [".gitconfig"] = {
            icon = "C",
            color = "#f1502f",
            name = "Gitconfig"
          },
          ["Makefile"] = {
            icon = "M",
            color = "#427819",
            name = "Makefile"
          },
          ["README.md"] = {
            icon = "R",
            color = "#519aba",
            name = "Readme"
          },
          ["package.json"] = {
            icon = "N",
            color = "#e8274b",
            name = "PackageJson"
          },
        },
        override_by_extension = {
          ["log"] = {
            icon = "L",
            color = "#81e043",
            name = "Log"
          },
          ["conf"] = {
            icon = "C",
            color = "#6d8086",
            name = "Conf"
          },
          ["yaml"] = {
            icon = "Y",
            color = "#cb171e",
            name = "Yaml"
          },
          ["yml"] = {
            icon = "Y",
            color = "#cb171e",
            name = "Yml"
          },
        },
      })
    end
  },

  -- lualine
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename'},
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        }
      })
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

  --gitsigns
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
        current_line_blame = false,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol',
          delay = 1000,
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          vim.keymap.set('n', '<leader>gb', function() gs.blame_line{full=true} end, {buffer = bufnr})
          vim.keymap.set('n', '<leader>gd', gs.diffthis, {buffer = bufnr})
          vim.keymap.set('n', '<leader>gp', gs.preview_hunk, {buffer = bufnr})
        end
      })
    end
  },

  --indent-blankline
  {
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

  --which-key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {}
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
  --nvim-ts-autotag
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup({
        enable = true,
        filetypes = { "html", "xml", "javascript", "typescript", "javascriptreact", "typescriptreact" },
      })
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
