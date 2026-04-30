-- for vscode
local map = vim.keymap.set
local vscode = require("vscode")

-- jumpy2
map({"n", "v"}, "<Leader>w", function()
    vscode.action("jumpy2.toggle")
end)

-- format
map({"n", "v"}, "<Leader>f", function()
    vscode.action("editor.action.formatDocument")
end)

-- fold toggle
map("n", "za", function()
    vscode.action("editor.toggleFold")
end)

-- git
-- 前後の変更点(Git)に移動
map("n", "<space>j", function()
    vscode.action("workbench.action.editor.nextChange")
end)
map("n", "<space>k", function()
    vscode.action("workbench.action.editor.previousChange")
end)
-- lazygit
map("n", "<space>g", function()
    vscode.action("lazygit.openLazygit")
end);

-- Space o でoil起動
map("n", "<space>o", function()
    vscode.action("oil-code.open")
end);

-- space zでzen mode
map("n", "<space>z", function()
    vscode.action("workbench.action.toggleZenMode")
end);
