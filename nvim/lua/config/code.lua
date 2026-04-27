-- for vscode
local map = vim.keymap.set
local opts = {
    noremap = true,
    silent = true
}

-- jumpy2
map({"n", "v"}, "<Leader>w", "<Cmd>call VSCodeNotify('jumpy2.toggle')<CR>", opts)

-- format
map({"n", "v"}, "<Leader>f", "<Cmd>call VSCodeNotify('editor.action.formatDocument')<CR>", opts)
