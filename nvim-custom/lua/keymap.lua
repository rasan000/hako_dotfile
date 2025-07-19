-- leader
vim.g.mapleader = ' '

-- ESC
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', {noremap = true, silent = true})

-- move visual line
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'j', 'gj', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'k', 'gk', { noremap = true, silent = true })

-- nohilight
vim.api.nvim_set_keymap('n', '<ESC><ESC>', '<Cmd>noh<CR>', { noremap = true, silent = true })

-- all select
vim.api.nvim_set_keymap('v', 'a', 'ggVG', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'v', '<C-v>', { noremap = true, silent = true })

-- window 
vim.api.nvim_set_keymap('n', 'ss', ':split<Return><C-w>w', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'sv', ':vsplit<Return><C-w>w', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'sh', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'sk', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'sj', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'sl', '<C-w>l', { noremap = true, silent = true })

-- blackhole
vim.api.nvim_set_keymap('n', 'x', '"_x', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'x', '"_x', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'X', '"_X', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'X', '"_X', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'X', '"_X', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'X', '"_X', { noremap = true, silent = true })

-- nop s key
vim.api.nvim_set_keymap('n', 's', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 's', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'S', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'S', '<nop>', { noremap = true, silent = true })

-- move when insert mode
vim.api.nvim_set_keymap('i', '<C-l>', '<Right>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-h>', '<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-j>', '<Down>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<Up>', { noremap = true, silent = true })

-- paste when insertMode
vim.api.nvim_set_keymap('i', '<C-r>', '<C-r>+', { noremap = true, silent = true })

-- replace
vim.api.nvim_set_keymap('n', '<C-g>', ':%s///<left><Left>', { noremap = true, silent = true })

-- IME
vim.api.nvim_set_keymap('i', '<ESC>', '<ESC><Cmd>:call system("${zenhan} 0")<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<ESC>', '<ESC><Cmd>:call system("${zenhan} 0")<CR>', { noremap = true })
vim.api.nvim_set_keymap('v', '<ESC>', '<ESC><Cmd>:call system("${zenhan} 0")<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', 'ｊｊ', '<ESC><Cmd>:call system("${zenhan} 0")<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', 'jj', '<ESC><Cmd>:call system("${zenhan} 0")<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', 'っ', '<ESC><Cmd>:call system("${zenhan} 0")<CR>', { noremap = true })

--設定ファイルを開く
vim.api.nvim_set_keymap('n', '<leader><F1>', ':edit $MYVIMRC<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><F2>', ':CocCommand snippets.editSnippets<CR>', { noremap = true, silent = true })
