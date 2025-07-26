return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					-- Add formatters when you install them
					javascript = { "prettier" },
					typescript = { "prettier" },
					lua = { "stylua" },
					python = { "black" },
				},
				format_on_save = {
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				},
			})

			-- formatkeymap
			vim.keymap.set({ "n", "v" }, "<leader>fo", function()
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				})
			end)

			-- Format command
			vim.api.nvim_create_user_command("Format", function()
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				})
				vim.notify("Formatted file", vim.log.levels.INFO, { title = "Formatter" })
			end, {})
		end,
	},
}
