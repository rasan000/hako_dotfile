return {

  -- persistence
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
      -- add any custom options here
    }
  },
  --which-key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      require("which-key").setup({
        preset = "modern",
        win = {
          border = "rounded",
        },
        spec = {
          { "<leader>f", group = "+find" },
          { "<leader>g", group = "+git" },
          { "<leader>l", group = "+lsp" },
          { "<leader>n", group = "+noice" },
          { "<leader>m", group = "+format" },
          { "<leader>b", group = "+buffer" },
          { "<leader>w", group = "+window" },
          { "<leader>t", group = "+toggle" },
          { "<leader>x", group = "+trouble" },
        },
      })

      -- F1 key for cheat sheet
      vim.keymap.set('n', '<F1>', function()
        local lines = {
          "=== Neovim Cheat Sheet ===",
          "",
          "=== Movement ===",
          "  s           - Flash jump (all screen)",
          "  S           - Flash treesitter jump",
          "  w/e/b       - Spider word movement",
          "  <M-n/p>     - Next/Prev illuminated word",
          "",
          "=== Edit ===",
          "  ys + motion - Add surround (ysiw\")",
          "  ds + char   - Delete surround (ds\")",
          "  cs + chars  - Change surround (cs\"')",
          "  Visual + S  - Surround selection",
          "  <M-h/j/k/l> - Move lines/blocks",
          "",
          "=== Files ===",
          "  <C-e>       - Toggle file tree",
          "  <leader>ff  - Find files",
          "  <leader>fg  - Live grep",
          "  <leader>fb  - Find buffers",
          "",
          "=== Buffer/Tab ===",
          "  gt/gT       - Next/Prev buffer",
          "  <leader>e   - Close buffer",
          "  <leader>q   - Close all but current",
          "",
          "=== LSP ===",
          "  gd          - Go to definition",
          "  K           - Show hover info",
          "  <leader>rn  - Rename",
          "  <leader>ca  - Code actions",
          "",
          "=== Git ===",
          "  <leader>gs  - Git status",
          "  <leader>gc  - Git commits",
          "",
          "=== Misc ===",
          "  <C-t>       - Toggle terminal",
          "  <leader>mp  - Format file",
          "  <leader>l   - Lint file",
          "  <F1>        - This help",
          "",
          "Press 'q' to close"
        }
        
        local buf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
        vim.bo[buf].modifiable = false
        vim.bo[buf].filetype = 'help'
        
        local width = 60
        local height = #lines + 2
        local row = math.ceil((vim.o.lines - height) / 2)
        local col = math.ceil((vim.o.columns - width) / 2)
        
        local opts = {
          relative = 'editor',
          width = width,
          height = height,
          row = row,
          col = col,
          style = 'minimal',
          border = 'rounded',
          title = ' Cheat Sheet ',
          title_pos = 'center',
        }
        
        local win = vim.api.nvim_open_win(buf, true, opts)
        vim.wo[win].winhl = 'Normal:Normal,FloatBorder:FloatBorder'
        
        -- Close on q or escape
        vim.api.nvim_buf_set_keymap(buf, 'n', 'q', '<cmd>close<CR>', {noremap = true, silent = true})
        vim.api.nvim_buf_set_keymap(buf, 'n', '<Esc>', '<cmd>close<CR>', {noremap = true, silent = true})
      end, { desc = "Show cheat sheet" })
    end,
  },

  -- Harpoon - File bookmarks for quick navigation
  {
    'ThePrimeagen/harpoon',
    branch = "harpoon2",
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require('harpoon')
      harpoon:setup()

      vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
      vim.keymap.set("n", "<C-h>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

      vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
      vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
      vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
      vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
    end,
  },

  -- Dressing - Better UI for vim.ui.select and vim.ui.input
  {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
    config = function()
      require('dressing').setup({
        input = {
          enabled = true,
          default_prompt = "Input: ",
          title_pos = "left",
          insert_only = true,
          start_in_insert = true,
          border = "rounded",
          relative = "cursor",
          prefer_width = 40,
          width = nil,
          max_width = { 140, 0.9 },
          min_width = { 20, 0.2 },
        },
        select = {
          enabled = true,
          backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },
          trim_prompt = true,
          telescope = require('telescope.themes').get_ivy(),
        },
      })
    end,
  },

  -- Fidget - LSP progress notifications
  {
    'j-hui/fidget.nvim',
    event = 'LspAttach',
    config = function()
      require('fidget').setup({
        progress = {
          poll_rate = 0,
          suppress_on_insert = false,
          ignore_done_already = false,
          ignore_empty_message = false,
          clear_on_detach = function(client_id)
            local client = vim.lsp.get_client_by_id(client_id)
            return client and client.name or nil
          end,
          notification_group = function(msg)
            return msg.lsp_server and msg.lsp_server.name or "LSP"
          end,
          ignore = {},
          display = {
            render_limit = 16,
            done_ttl = 3,
            done_icon = "✓",
            done_style = "Constant",
            progress_ttl = math.huge,
            progress_icon = { pattern = "dots", period = 1 },
            progress_style = "WarningMsg",
            group_style = "Title",
            icon_style = "Question",
            priority = 30,
            skip_history = true,
            format_message = function(msg)
              local message = msg.message
              if not message then
                message = msg.done and "completed" or "in progress"
              end
              if msg.percentage ~= nil then
                message = string.format("%s (%.0f%%)", message, msg.percentage)
              end
              return message
            end,
            format_annote = function(msg)
              return msg.title
            end,
            format_group_name = function(group)
              return tostring(group)
            end,
            overrides = {
              rust_analyzer = { name = "rust-analyzer" },
            },
          },
        },
        notification = {
          poll_rate = 10,
          filter = vim.log.levels.INFO,
          history_size = 128,
          override_vim_notify = false,
          configs = { default = require('fidget.notification').default_config },
          redirect = function(msg, level, opts)
            if opts and opts.on_open then
              return require('fidget.integration.nvim-notify').delegate(msg, level, opts)
            end
          end,
          view = {
            stack_upwards = true,
            icon_separator = " ",
            group_separator = "---",
            group_separator_hl = "Comment",
            render_message = function(msg, cnt)
              return cnt == 1 and msg or string.format("(%dx) %s", cnt, msg)
            end,
          },
          window = {
            normal_hl = "Comment",
            winblend = 100,
            border = "none",
            zindex = 45,
            max_width = 0,
            max_height = 0,
            x_padding = 1,
            y_padding = 0,
            align = "bottom",
            relative = "editor",
          },
        },
        integration = {
          ["nvim-tree"] = {
            enable = true,
          },
        },
        logger = {
          level = vim.log.levels.WARN,
          max_size = 10000,
          float_precision = 0.01,
          path = string.format("%s/fidget.nvim.log", vim.fn.stdpath("cache")),
        },
      })
    end,
  },

}
