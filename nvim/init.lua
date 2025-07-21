if not vim.g.vscode then
  require("option")
  require("keymap")
  require("plugin")
else
  require("code")
end
