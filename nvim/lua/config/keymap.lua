local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- leader key をスペースに設定
vim.g.mapleader = " "

-- d/c はヤンクさせない
map({ "n", "x" }, "d", '"_d', opts)
map({ "n" }, "dd", '"_dd', opts)
map({ "n", "x" }, "D", '"_D', opts)
map({ "n", "x" }, "c", '"_c', opts)
map({ "n" }, "C", '"_C', opts)

-- move keys
map("n", "<S-h>", "^", opts)
map("n", "<S-l>", "$", opts)
map("v", "<S-h>", "^", opts)
map("v", "<S-l>", "$", opts)
map("n", "<S-m>", "%", opts)
map("v", "<S-m>", "%", opts)

-- normalモードでのxは削除
-- visualモードでのxは切り取り
map({ "n" }, "x", '"_x', opts)
map({ "n" }, "X", '"_X', opts)

-- ; と : の入れ替え
map({ "n", "v" }, ";", ":", opts)
map({ "n", "v" }, ":", ";", opts)

-- nohlsearch
map("n", "<leader><space>", ":nohlsearch<CR>", opts)

-- row select
map("n", "vv", "<S-v>", opts)

-- disable s key
map({ "n", "x" }, "s", "<Nop>", opts)
map({ "n", "x" }, "S", "<Nop>", opts)
