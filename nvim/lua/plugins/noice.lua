return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      vim.keymap.set("n", "<leader>dn", function()
        require("notify").dismiss({ silent = true })
      end, { desc = "Dismiss notifications" })

      require("noice").setup({
        notify = {
          enabled = true,
        },
        messages = {
          enabled = true,
          view = "mini",
          view_error = "mini",
          view_warn = "mini",
          view_history = "messages",
          view_search = "virtualtext",
        },
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = false,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = true,
          lsp_doc_border = true,
        },
      })
      -- noice keymaps
      vim.keymap.set("n", "<leader>nl", "<cmd>Noice last<cr>", { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>ne", "<cmd>Noice errors<cr>", { noremap = true, silent = true })
    end,
  },
}
