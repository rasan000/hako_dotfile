return {
  'sirasagi62/toggle-cheatsheet.nvim',
  config = function()
    -- loading the plugin
    local tcs = require('toggle-cheatsheet').setup(true)

    -- make your own cheat sheet
    local cs1 = tcs.createCheatSheetFromSubmodeKeymap(
      tcs.conf {
        { "cs",         "change surround symbol" },
        { "ds",         "delete surround symbol" },
        { "ys",         "surround selection/motion" },
        { "ysiw",       "surround word" },
        { "gd",         "go to definition" },
        { "gr",         "go to references" },
        { "gD",         "go to declaration" },
        { "<C-o>",      "jump back" },
        { "<C-i>",      "jump forward" },
        { "<leader>rn", "rename symbol" },
        { "<leader>xx", "check error list" },
      }
    )

    vim.keymap.set("n", "<F1>", function()
      tcs.toggle(cs1)
    end)
  end,

}
