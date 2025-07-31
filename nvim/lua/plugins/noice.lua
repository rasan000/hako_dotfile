return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("noice").setup({
				notify = {
					enabled = true,
				},
				lsp = {
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				presets = {
					bottom_search = true,
					command_palette = true,
					long_message_to_split = true,
					inc_rename = false,
					lsp_doc_border = false,
				},
			})

			-- noice keymaps
			vim.keymap.set("n", "<leader>nl", "<cmd>Noice last<cr>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>ne", "<cmd>Noice errors<cr>", { noremap = true, silent = true })
		end,
	},
}
