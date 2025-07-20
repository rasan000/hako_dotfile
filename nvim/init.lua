-- lua/ディレクトリ下のファイルを自動読み込み
if not vim.g.vscode then
  -- 基本設定
  require("option")
  require("keymap")
  require("plugin")
else
  require("code")
end
