-- leader
vim.g.mapleader = ' '

-- ESC
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', {noremap = true, silent = true})

-- move visual line
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'j', 'gj', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'k', 'gk', { noremap = true, silent = true })

-- nohilight
vim.api.nvim_set_keymap('n', '<ESC><ESC>', '<Cmd>noh<CR>', { noremap = true, silent = true })

-- all select
vim.api.nvim_set_keymap('v', 'a', '<ESC>ggVG', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'v', '<S-v>', { noremap = true, silent = true })

-- blackhole
vim.api.nvim_set_keymap('n', 'x', '"_x', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'X', '"_X', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'd', '"_d', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'dd', '"_dd', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'D', '"_D', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'd', '"_d', { noremap = true, silent = true })

-- move when insert mode
vim.api.nvim_set_keymap('i', '<C-l>', '<Right>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-h>', '<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-j>', '<Down>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<Up>', { noremap = true, silent = true })

-- paste when insertMode
vim.api.nvim_set_keymap('i', '<C-r>', '<C-r>+', { noremap = true, silent = true })

-- replace
vim.api.nvim_set_keymap('n', '<C-g>', ':%s///<left><Left>', { noremap = true, silent = true })

-- option
vim.api.nvim_set_keymap('n', '<leader><F1>', ':edit $MYVIMRC<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><F2>', ':CocCommand snippets.editSnippets<CR>', { noremap = true, silent = true })
