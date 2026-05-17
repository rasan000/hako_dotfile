return {

    --barbar
    {
        "romgrk/barbar.nvim",
        dependencies = {
            "nvim-web-devicons"
        },
        opts = {
            auto_hide = true,
            animation = false,
        },
        config = function()
            vim.api.nvim_set_keymap("n", "<C-j>", "<cmd>BufferNext<CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>BufferPrevious<CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<C-w>r", "<cmd>BufferRestore<CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<C-w>e", "<Cmd>BufferClose!<CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<C-w>p", "<Cmd>BufferPin<CR>", { noremap = true, silent = true })
        end,
    },
}