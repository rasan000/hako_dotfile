vim.opt.wildmenu = true

-- vim.opt.wrap = false
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.showtabline = 1

-- clipboard
vim.opt.clipboard = 'unnamedplus'

-- encoding
vim.opt.fileencoding = "utf-8"
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"


-- row number
vim.opt.number = true

-- tab
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true

-- use mouse
vim.opt.mouse = "a"

-- delte buffa
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.swapfile = false

vim.opt.shell = 'zsh'

vim.opt.title = true

-- 
vim.opt.inccommand = split

-- hilight yank
vim.api.nvim_set_hl(0, "YankHighlight", { bg = "#FFFFFF" })

vim.cmd [[
    let &shell='/usr/bin/bash --login'
]]
vim.api.nvim_set_keymap('i', '<ESC>', '<ESC><Cmd>:call system("${zenhan} 0")<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<ESC>', '<ESC><Cmd>:call system("${zenhan} 0")<CR>', { noremap = true })
vim.api.nvim_set_keymap('v', '<ESC>', '<ESC><Cmd>:call system("${zenhan} 0")<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', 'ｊｊ', '<ESC><Cmd>:call system("${zenhan} 0")<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', 'jj', '<ESC><Cmd>:call system("${zenhan} 0")<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', 'っ', '<ESC><Cmd>:call system("${zenhan} 0")<CR>', { noremap = true })

