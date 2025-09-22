return {
    {
        'ixru/nvim-markdown',
        ft = 'markdown',
        config = function()
            -- disable preview
            vim.g.vim_markdown_conceal = 0
        end
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
        ft = { "markdown" },
        keys = {
            { "<Space>md", ":RenderMarkdown toggle<CR>" },
        },
        opts = {
            render_modes = true
        },
    }
}
