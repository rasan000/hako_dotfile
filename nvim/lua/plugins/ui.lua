return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			local highlight = {
				"Whitespace",
			}
			local hooks = require("ibl.hooks")
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "Whitespace", { fg = "#363a42" })
			end)
			require("ibl").setup({
				indent = {
					char = "▏",
					highlight = highlight,
				},
				scope = {
					enabled = false,
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
				float = true,
				direction = "float",
				float_opts = {
					border = "curved",
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
}
