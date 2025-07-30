--IME
vim.cmd([[
    let &shell='/usr/bin/zsh'
]])
local zenhan = "DISPLAY=:0 /usr/local/bin/zenhan 0" -- must be set to your zenhan command path

-- leader
vim.g.mapleader = " "

-- ESC
vim.keymap.set("i", "jk", "<ESC>", { noremap = true, silent = true })
vim.keymap.set("i", "kj", "<ESC>", { noremap = true, silent = true })
vim.keymap.set("i", "kj", "<ESC>", { noremap = true, silent = true })
vim.keymap.set("i", "kj", "<ESC>", { noremap = true, silent = true })
-- vim.keymap.set("v", "jk", "<ESC>", { noremap = true, silent = true })
-- vim.keymap.set("v", "kj", "<ESC>", { noremap = true, silent = true })
-- vim.keymap.set("c", "jk", "<ESC>", { noremap = true, silent = true })
vim.keymap.set("c", "kj", "<ESC>", { noremap = true, silent = true })
-- vim.keymap.set("o", "jk", "<ESC>", { noremap = true, silent = true })
-- vim.keymap.set("o", "kj", "<ESC>", { noremap = true, silent = true })
vim.keymap.set("i", "<ESC>", '<ESC><Cmd>:call system("' .. zenhan .. '")<CR>', { noremap = true })
-- vim.api.nvim_set_keymap("n", "<ESC>", '<ESC><Cmd>:call system("' .. zenhan .. '")<CR>', { noremap = true })
-- vim.api.nvim_set_keymap("v", "<ESC>", '<ESC><Cmd>:call system("' .. zenhan .. '")<CR>', { noremap = true })
vim.keymap.set("i", "ｊk", '<ESC><Cmd>:call system("' .. zenhan .. '")<CR>', { noremap = true })

-- v+v to Shift+v
vim.keymap.set("v", "v", "<S-v>", { noremap = true, silent = true })

-- save
vim.keymap.set("n", "<leader>w", "<Cmd>w<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", "<Cmd>q!<CR>", { noremap = true, silent = true })

-- comment
vim.keymap.set("n", "<leader>/", "<cmd>normal gcc<cr>", { noremap = true, silent = true })
vim.keymap.set("v", "<leader>/", "<cmd>normal gc<cr>", { noremap = true, silent = true })

-- move visual line
vim.keymap.set("n", "j", "gj", { noremap = true, silent = true })
vim.keymap.set("n", "k", "gk", { noremap = true, silent = true })
vim.keymap.set("v", "j", "gj", { noremap = true, silent = true })
vim.keymap.set("v", "k", "gk", { noremap = true, silent = true })

-- move row start and end
vim.keymap.set("n", "<leader>h", "^", { noremap = true, silent = true })
vim.keymap.set("v", "<leader>h", "^", { noremap = true, silent = true })
vim.keymap.set("o", "<leader>h", "^", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>l", "$", { noremap = true, silent = true })
vim.keymap.set("v", "<leader>l", "$", { noremap = true, silent = true })
vim.keymap.set("o", "<leader>l", "$", { noremap = true, silent = true })

-- redo
vim.keymap.set("n", "U", "<C-r>", { noremap = true, silent = true })
-- move {}
vim.keymap.set("n", "<leader>m", "%", { noremap = true, silent = true })
vim.keymap.set("v", "<leader>m", "%", { noremap = true, silent = true })

-- nohighlight
vim.keymap.set("n", "<leader>n", "<Cmd>noh<CR>", { noremap = true, silent = true })
-- nohilight
vim.keymap.set("n", "<ESC><ESC>", "<Cmd>noh<CR>", { noremap = true, silent = true })

-- blackhole
vim.keymap.set("n", "x", '"_x', { noremap = true, silent = true })
vim.keymap.set("n", "X", '"_X', { noremap = true, silent = true })
vim.keymap.set("n", "d", '"_d', { noremap = true, silent = true })
vim.keymap.set("n", "dd", '"_dd', { noremap = true, silent = true })
vim.keymap.set("n", "D", '"_D', { noremap = true, silent = true })
vim.keymap.set("v", "d", '"_d', { noremap = true, silent = true })

-- move when insert mode and command mode
vim.keymap.set("i", "<C-f>", "<Right>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-b>", "<Left>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-n>", "<Down>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-p>", "<Up>", { noremap = true, silent = true })
vim.keymap.set("c", "<C-f>", "<Right>", { noremap = true, silent = true })
vim.keymap.set("c", "<C-b>", "<Left>", { noremap = true, silent = true })
vim.keymap.set("c", "<C-n>", "<Down>", { noremap = true, silent = true })
vim.keymap.set("c", "<C-p>", "<Up>", { noremap = true, silent = true })

-- paste when insertMode
vim.keymap.set("i", "<C-r>", "<C-r>+", { noremap = true, silent = true })

-- replace
vim.keymap.set("n", "<C-g>", ":%s///<left><Left>", { noremap = true, silent = true })

-- nvim-tree toggle
vim.keymap.set("n", "<C-e>", "<cmd>NvimTreeToggle<cr>", { noremap = true, silent = true })

-- mark key bindings
vim.keymap.set("n", "M", "`", { noremap = true, silent = true })
vim.keymap.set("v", "M", "`", { noremap = true, silent = true })
vim.keymap.set("n", "ml", "<Cmd>marks<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "ml", "<Cmd>marks<CR>", { noremap = true, silent = true })
