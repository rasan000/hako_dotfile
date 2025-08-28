return {
  {
    'saghen/blink.cmp',
    dependencies = {
      'rafamadriz/friendly-snippets',
      'L3MON4D3/LuaSnip'
    },
    version = '1.*',
    opts = {
      keymap = {
        preset = 'none',
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        ["<C-p>"] = { "select_prev", "snippet_backward", "fallback" },
        ["<Up>"] = { "select_prev", "snippet_backward", "fallback" },
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<C-n>"] = { "select_next", "snippet_forward", "fallback" },
        ["<Down>"] = { "select_next", "snippet_forward", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
        ["<Esc>"] = { "hide", "fallback" },

        -- for copilot
        ["<C-y>"] = { "fallback" },
      },

      appearance = {
        nerd_font_variant = 'mono'
      },

      completion = {
        list = {
          selection = { preselect = false, autoinsert = true }
        },
        documentation = { auto_show = true }
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      snippets = {
        preset = 'luasnip',
      },

      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  },

  --lua snip
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    dependencies = {
      { "rafamadriz/friendly-snippets" },
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  }
}
