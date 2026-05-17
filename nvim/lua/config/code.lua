-- for vscode
local map = vim.keymap.set
local vscode = require("vscode")

-- format
map({"n", "v"}, "<space>f", function()
    vscode.action("editor.action.formatDocument")
end)

-- fold toggle
map("n", "<space>m", function()
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

-- space zでzen mode
map("n", "<space>z", function()
    vscode.action("workbench.action.toggleZenMode")
end);

-- comment
map({"n", "v"}, "<space>/", function()
    vscode.action("editor.action.commentLine")
end)

-- window
map({"n", "v"}, "<C-w>r", function()
    vscode.action("workbench.action.reopenClosedEditor")
end)
map({"n", "v"}, "<C-w>p", function()
    vscode.action("workbench.action.pinEditor")
end)

-- replace(require send key setting to vscode)
map({"n", "v"}, "<C-g>", function()
    vscode.action("editor.action.startFindReplaceAction")
end)

-- flash(require bk and escape key setting to vscode)
map({"n", "v"}, "f", function()
    vscode.action("flash-vscode.start")
end)
map({"n", "v"}, "s", function()
    vscode.action("flash-vscode.jump.treesitterSelection")
end)

-- oil.code
vim.keymap.set("n", "<space>o", function()
  vscode.action("oil-code.open")
end)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "oil",
  callback = function(event)
    -----------------------------------------------
    -- Oil.Codeのタブが開かれたときだけ設定するキーマップ
    -----------------------------------------------
    local opts = { buffer = event.buf, noremap = true, silent = true }
    vim.keymap.set("n", "<CR>", function()
      vscode.action("oil-code.select")
    end, opts)
    vim.keymap.set("n", "<C-CR>", function()
      vscode.action("oil-code.selectVertical")
    end, opts)
    -- 水平方向に展開するコマンドはないので複数コマンドを同期で連続させる
    vim.keymap.set("n", "<C-s>", function()
      vscode.call("workbench.action.splitEditorDown")
      vscode.call("oil-code.selectTab")
      vscode.call("workbench.action.previousEditorInGroup")
      vscode.call("workbench.action.closeActiveEditor")
    end, opts)

    vim.keymap.set("n", "-", function()
      vscode.action("oil-code.openParent")
    end, opts)
    vim.keymap.set("n", "_", function()
      vscode.action("oil-code.openCwd")
    end, opts)
    vim.keymap.set("n", "<C-l>", function()
      vscode.action("oil-code.refresh")
    end, opts)
  end,
})
