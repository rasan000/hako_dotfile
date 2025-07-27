return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			require("ibl").setup({
				indent = {
					char = "▏",
				},
				scope = {
					enabled = true,
					show_start = false,
					show_end = false,
				},
			})
		end,
	},

	--terminal
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup({
				size = 20,
				open_mapping = [[<c-t>]],
				direction = "horizontal",
				float_opts = {
					border = "curved",
					width = 150,
					height = 25,
				},
				shade_terminals = true,
			})
			vim.api.nvim_create_user_command("Term", function()
				require("toggleterm").toggle()
			end, {})
			local opts = { noremap = true, silent = true }

			vim.api.nvim_set_keymap("t", "<esc>", [[<C-\><C-n>]], opts)
		end,
	},

	--nvim-scrollbar
	{
		"petertriho/nvim-scrollbar",
		event = "VeryLazy",
		config = function()
			require("scrollbar").setup({
				handlers = {
					search = true,
					gitsigns = true,
					diagnostics = true,
				},
				excluded_filetypes = { "cmp_menu", "cmp_docs", "TelescopePrompt" },
			})
		end,
	},
}
