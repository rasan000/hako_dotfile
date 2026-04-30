return {
  "phaazon/hop.nvim",
  branch = "v2",
  event = "VeryLazy",
  opts = {},
  keys = {
    { "s", mode = { "n", "x" }, function() require("hop").hint_words() end,      desc = "Hop words" },
    { "<leader>l", mode = { "n", "x" }, function() require("hop").hint_lines() end,      desc = "Hop lines" },
    { "<leader><leader>", mode = { "n", "x" }, function() require("hop").hint_char1() end,      desc = "Hop char" },
  },
}