return {

	--barbar
	{
		"romgrk/barbar.nvim",
		config = function()
			require("barbar").setup({
				auto_hide = true,
			})
			vim.api.nvim_set_keymap("n", "gt", "<cmd>BufferNext<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "gT", "<cmd>BufferPrevious<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<leader>br", "<cmd>BufferRestore<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<leader>e", "<Cmd>BufferClose!<CR>", { noremap = true, silent = true })
		end,
	},
}
