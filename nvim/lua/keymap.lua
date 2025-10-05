-- emacs style cursor movement in insert mode
vim.keymap.set({ "i", "c" }, "<C-b>", "<Left>", { noremap = true, silent = true })
vim.keymap.set({ "i", "c" }, "<C-f>", "<Right>", { noremap = true, silent = true })
vim.keymap.set({ "i", "c" }, "<C-p>", "<Up>", { noremap = true, silent = true })
vim.keymap.set({ "i", "c" }, "<C-n>", "<Down>", { noremap = true, silent = true })
vim.keymap.set({ "i", "c" }, "<C-h>", "<BS>", { noremap = true, silent = true })

-- leader
vim.g.mapleader = " "

-- vertical window
vim.keymap.set("n", "<C-w><Enter>", "<C-w>v", { noremap = true, silent = true })

-- ESC with save
vim.keymap.set("i", "jj", "<ESC>", { noremap = true, silent = true })
vim.keymap.set("i", "jk", "<ESC><Cmd>w<CR>", { noremap = true, silent = true })

-- no highlight
vim.keymap.set("n", "<leader>no", "<Cmd>noh<CR>", { noremap = true })

-- v+v to Shift+v
vim.keymap.set("v", "v", "<S-v>", { noremap = true, silent = true })

-- comment
vim.keymap.set("n", "<leader>/", "<cmd>normal gcc<cr>", { noremap = true, silent = true })
vim.keymap.set("v", "<leader>/", "<cmd>normal gc<cr>", { noremap = true, silent = true })

-- move visual line
vim.keymap.set("n", "j", "gj", { noremap = true, silent = true })
vim.keymap.set("n", "k", "gk", { noremap = true, silent = true })
vim.keymap.set("v", "j", "gj", { noremap = true, silent = true })
vim.keymap.set("v", "k", "gk", { noremap = true, silent = true })

-- move row start and end
vim.keymap.set({ "n", "v", "o" }, "H", "^", { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "o" }, "L", "$", { noremap = true, silent = true })

-- move {}
vim.keymap.set("n", "<TAB>", "%", { noremap = true, silent = true })
vim.keymap.set("v", "<TAB>", "%", { noremap = true, silent = true })

-- blackhole
-- virtual mode x is cut
vim.keymap.set("n", "x", '"_x', { noremap = true, silent = true })
vim.keymap.set("n", "X", '"_X', { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "d", '"_d', { noremap = true, silent = true })
vim.keymap.set("n", "dd", '"_dd', { noremap = true, silent = true })
vim.keymap.set("n", "D", '"_D', { noremap = true, silent = true })

-- paste
vim.keymap.set({ "i", "c" }, "<C-v>", "<C-r>+", { noremap = true })
vim.keymap.set("c", "<C-g>", "<C-v>", { noremap = true })

-- replace
vim.keymap.set("n", "<C-g>", ":%s///g<left><left><Left>", { noremap = true })


-- mark key bindings
vim.keymap.set("n", "ml", "<Cmd>marks<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "ml", "<Cmd>marks<CR>", { noremap = true, silent = true })

-- all select
vim.keymap.set("n", "va", "ggVG", { noremap = true, silent = true })

-- mark jump
vim.keymap.set({ "n", "v" }, "<leader>m", "`", { noremap = true, silent = true })

-- funcitonkey bindings
-- F1 help
vim.keymap.set("n", "<F2>", ":set wrap!<CR>", { noremap = true })
vim.keymap.set("n", "<F3>", ":set relativenumber!<CR>", { noremap = true })
