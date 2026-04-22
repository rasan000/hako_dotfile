-- for vscode
local vscode = require('vscode-neovim')

-- vim.opt.report = 999999
-- vim.opt.shortmess:append("sSwWF")

-- n/N の msg_show イベント自体を silent で抑制
vim.keymap.set('n', 'n', function()
    vim.cmd('silent! normal! ' .. vim.v.count1 .. 'n')
end, { silent = true })
vim.keymap.set('n', 'N', function()
    vim.cmd('silent! normal! ' .. vim.v.count1 .. 'N')
end, { silent = true })

-- https://zenn.dev/januswel/articles/bf117ede3f5091
local mappings = {
    up = 'k',
    down = 'j',
    wrappedLineStart = '0',
    wrappedLineFirstNonWhitespaceCharacter = '^',
    wrappedLineEnd = '$'
}

local function moveCursor(to, select)
    return function()
        local mode = vim.api.nvim_get_mode()
        if mode.mode == 'V' or mode.mode == '' then
            return mappings[to]
        end

        vscode.action('cursorMove', {
            args = {{
                to = to,
                by = 'wrappedLine',
                value = vim.v.count1,
                select = select
            }}
        })
        return '<Ignore>'
    end
end

vim.keymap.set('n', 'k', moveCursor('up'), {
    expr = true
})
vim.keymap.set('n', 'j', moveCursor('down'), {
    expr = true
})

-- vim.keymap.set('v', 'k', moveCursor('up', true), {
--     expr = true
-- })
-- vim.keymap.set('v', 'j', moveCursor('down', true), {
--     expr = true
-- })
