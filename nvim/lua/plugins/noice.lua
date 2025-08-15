return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			vim.keymap.set("n", "<leader>dn", function()
				require("notify").dismiss({ silent = true })
			end, { desc = "Dismiss notifications" })

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
					command_palette = false,
					long_message_to_split = true,
					inc_rename = false,
					lsp_doc_border = false,
				},
				-- Fix for colon/semicolon swap
				routes = {
					{
						view = "cmdline",
						filter = { event = "cmdline" },
						opts = {
							-- Ensure noice doesn't interfere with : mapping
							enter = false,
						},
					},
				},
			})

			-- noice keymaps
			vim.keymap.set("n", "<leader>nl", "<cmd>Noice last<cr>", { noremap = true, silent = true })
			vim.keymap.set("n", "<leader>ne", "<cmd>Noice errors<cr>", { noremap = true, silent = true })
		end,
	},
}
