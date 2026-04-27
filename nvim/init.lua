require("config.keymap")
require("config.option")
require("config.lazy")

if vim.g.vscode then
  require("config.code")
end
