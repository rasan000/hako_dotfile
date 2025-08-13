--IME
vim.cmd([[
    let &shell='/usr/bin/zsh'
]])
local zenhan = "DISPLAY=:0 /usr/local/bin/zenhan 0" -- must be set to your zenhan command path

-- leader
vim.g.mapleader = " "

-- ESC with save
vim.keymap.set("i", "jj", "<ESC>", { noremap = true, silent = true })
vim.keymap.set("i", "jk", "<ESC><Cmd>w<CR>", { noremap = true, silent = true })
vim.keymap.set("c", "jj", "<ESC>", { noremap = true, silent = true })
vim.keymap.set("c", "jk", "<ESC><Cmd>w<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<ESC>", '<ESC><Cmd>:call system("' .. zenhan .. '")<CR>', { noremap = true })
vim.keymap.set("n", "<ESC>", '<ESC><Cmd>:call system("' .. zenhan .. '")<CR>', { noremap = true })
vim.keymap.set("v", "<ESC>", '<ESC><Cmd>:call system("' .. zenhan .. '")<CR>', { noremap = true })
vim.keymap.set("i", "ｊｋ", '<ESC><Cmd>:call system("' .. zenhan .. '")<CR>', { noremap = true })

-- no highlight
vim.keymap.set("n", "<ESC><ESC>", "<Cmd>noh <CR>", { noremap = true })

-- v+v to Shift+v
vim.keymap.set("v", "v", "<S-v>", { noremap = true, silent = true })

-- remap : ;
vim.keymap.set({ "n", "v" }, ";", ":", { noremap = true })
vim.keymap.set({ "n", "v" }, ":", ";", { noremap = true })

-- quit
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
vim.keymap.set("n", "H", "^", { noremap = true, silent = true })
vim.keymap.set("v", "H", "^", { noremap = true, silent = true })
vim.keymap.set("o", "H", "^", { noremap = true, silent = true })
vim.keymap.set("n", "L", "$", { noremap = true, silent = true })
vim.keymap.set("v", "L", "$", { noremap = true, silent = true })
vim.keymap.set("o", "L", "$", { noremap = true, silent = true })

-- redo
vim.keymap.set("n", "U", "<C-r>", { noremap = true, silent = true })

-- move {}
vim.keymap.set("n", "<TAB>", "%", { noremap = true, silent = true })
vim.keymap.set("v", "<TAB>", "%", { noremap = true, silent = true })

-- blackhole
vim.keymap.set("n", "x", '"_x', { noremap = true, silent = true })
vim.keymap.set("n", "X", '"_X', { noremap = true, silent = true })
vim.keymap.set("n", "d", '"_d', { noremap = true, silent = true })
vim.keymap.set("n", "dd", '"_dd', { noremap = true, silent = true })
vim.keymap.set("n", "D", '"_D', { noremap = true, silent = true })
vim.keymap.set("v", "d", '"_d', { noremap = true, silent = true })

-- paste
vim.keymap.set("i", "<C-r>", "<C-r>+", { noremap = true, silent = true })
vim.keymap.set("c", "<C-r>", "<C-r>+", { noremap = true, silent = true })

-- replace
vim.keymap.set("n", "<C-g>", ":%s///g<left><left><Left>", { noremap = true, silent = true })

-- nvim-tree toggle
vim.keymap.set("n", "<C-e>", "<cmd>NvimTreeToggle<cr>", { noremap = true, silent = true })

-- mark key bindings
vim.keymap.set("n", "<leader>m", "`", { noremap = true, silent = true })
vim.keymap.set("v", "<leader>m", "`", { noremap = true, silent = true })
vim.keymap.set("n", "ml", "<Cmd>marks<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "ml", "<Cmd>marks<CR>", { noremap = true, silent = true })

-- all select
vim.keymap.set("n", "va", "ggVG", { noremap = true, silent = true })

-- funcitonkey bindings
-- F1 help
vim.keymap.set("n", "<F2>", ":set wrap!<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<F3>", ":set relativenumber!<CR>", { noremap = true, silent = true })
