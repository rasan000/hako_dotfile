vim.opt.wildmenu = true

-- zsh
vim.opt.shell = "/usr/bin/zsh"
-- vim.opt.wrap = false
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.showtabline = 1

vim.opt.autoread = true
-- auto read
vim.api.nvim_create_autocmd({ "WinEnter", "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  command = "checktime",
})

-- Automatically reload files when they change on disk
vim.api.nvim_create_autocmd({ "FileChangedShellPost" }, {
  pattern = "*",
  callback = function()
    vim.notify("File changed on disk. Buffer reloaded.", vim.log.levels.WARN)
  end,
})

-- Check for file changes more frequently
vim.opt.updatetime = 1000

-- clipboard
vim.opt.clipboard = 'unnamedplus'

-- encoding
vim.opt.fileencoding = "utf-8"
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"

-- row number
vim.opt.cursorline = true -- Highlight current line
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

-- scroll settings
vim.opt.scroll = 10 -- number of lines to scroll with Ctrl-u/Ctrl-d

-- split direction (open splits to right and below)
vim.opt.splitright = true -- vertical splits open to the right
vim.opt.splitbelow = true -- horizontal splits open below

-- delete buffa
vim.opt.hidden = true
vim.opt.confirm = false
vim.opt.backup = false
vim.opt.swapfile = false

-- title
vim.opt.title = true

-- undo file persistence
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"

-- cursor position restore
vim.api.nvim_create_autocmd("BufRead", {
  callback = function()
    vim.api.nvim_exec('silent! normal! g`"zv', false)
  end,
})

--
vim.opt.inccommand = split

-- hilight yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })
  end,
})

-- markdown specific settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
    vim.opt_local.autoindent = true
    vim.opt_local.smartindent = true
  end,
})

--IME
vim.cmd [[
    let &shell='/usr/bin/zsh'
]]
local zenhan = 'DISPLAY=:0 /usr/local/bin/zenhan 0' -- must be set to your zenhan command path
vim.api.nvim_set_keymap('i', '<ESC>', '<ESC><Cmd>:call system("' .. zenhan .. '")<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<ESC>', '<ESC><Cmd>:call system("' .. zenhan .. '")<CR>', { noremap = true })
vim.api.nvim_set_keymap('v', '<ESC>', '<ESC><Cmd>:call system("' .. zenhan .. '")<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', 'ｊｊ', '<ESC><Cmd>:call system("' .. zenhan .. '")<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', 'jj', '<ESC><Cmd>:call system("' .. zenhan .. '")<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', 'っ', '<ESC><Cmd>:call system("' .. zenhan .. '")<CR>', { noremap = true })
