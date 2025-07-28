-- leader
vim.g.mapleader = " "

-- ESC
vim.keymap.set("i", "jj", "<ESC>", { noremap = true, silent = true })
vim.keymap.set("i", "jk", "<ESC>", { noremap = true, silent = true })

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
vim.keymap.set("n", "H", "^", { noremap = true, silent = true })
vim.keymap.set("n", "L", "$", { noremap = true, silent = true })

-- redo
vim.keymap.set("n", "U", "<C-r>", { noremap = true, silent = true })
-- nohilight
vim.keymap.set("n", "<ESC><ESC>", "<Cmd>noh<CR>", { noremap = true, silent = true })

-- all select
vim.keymap.set("v", ",", function()
	vim.cmd("normal! ggVG")
end, { noremap = true, silent = true })
vim.keymap.set("v", "v", "<S-v>", { noremap = true, silent = true })

-- move {}
vim.keymap.set("n", "M", "%", { noremap = true, silent = true })
vim.keymap.set("v", "M", "%", { noremap = true, silent = true })

-- nohighlight
vim.keymap.set("n", "<leader>n", "<Cmd>noh<CR>", { noremap = true, silent = true })

-- blackhole
vim.keymap.set("n", "x", '"_x', { noremap = true, silent = true })
vim.keymap.set("n", "X", '"_X', { noremap = true, silent = true })
vim.keymap.set("n", "d", '"_d', { noremap = true, silent = true })
vim.keymap.set("n", "dd", '"_dd', { noremap = true, silent = true })
vim.keymap.set("n", "D", '"_D', { noremap = true, silent = true })
vim.keymap.set("v", "d", '"_d', { noremap = true, silent = true })

-- move when insert mode
vim.keymap.set("i", "<C-l>", "<Right>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-h>", "<Left>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-j>", "<Down>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-k>", "<Up>", { noremap = true, silent = true })

-- paste when insertMode
vim.keymap.set("i", "<C-r>", "<C-r>+", { noremap = true, silent = true })

-- replace
vim.keymap.set("n", "<C-g>", ":%s///<left><Left>", { noremap = true, silent = true })

-- nvim-tree toggle
vim.keymap.set("n", "<C-e>", "<cmd>NvimTreeToggle<cr>", { noremap = true, silent = true })

-- paste and move cursor to the end
-- vim.keymap.set("n", "p", "p`]", { noremap = true, silent = true })
-- vim.keymap.set("n", "P", "p`]", { noremap = true, silent = true })

-- yank and move cursor to the end in visual mode
-- vim.keymap.set("v", "y", "y`]", { noremap = true, silent = true })

-- mark key bindings
vim.keymap.set("n", "<leader>m", "`", { noremap = true, silent = true })
vim.keymap.set("v", "<leader>m", "`", { noremap = true, silent = true })

-- disable middle click
-- vim.keymap.set({ "n", "i", "v" }, "<MiddleMouse>", "<Nop>")
-- vim.keymap.set({ "n", "i", "v" }, "<2-MiddleMouse>", "<Nop>")
-- vim.keymap.set({ "n", "i", "v" }, "<3-MiddleMouse>", "<Nop>")
-- vim.keymap.set({ "n", "i", "v" }, "<4-MiddleMouse>", "<Nop>")
