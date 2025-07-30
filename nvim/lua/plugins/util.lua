return {

	-- persistence
	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		opts = {
			-- add any custom options here
		},
	},

	-- Harpoon - File bookmarks for quick navigation
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup()

			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():add()
			end, { desc = "Add current file to Harpoon" })
			vim.keymap.set("n", "<C-h>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end, { desc = "Toggle Harpoon quick menu" })
		end,
	},

	-- Dressing - Better UI for vim.ui.select and vim.ui.input
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		config = function()
			require("dressing").setup({
				input = {
					enabled = true,
					default_prompt = "Input: ",
					title_pos = "left",
					insert_only = true,
					start_in_insert = true,
					border = "rounded",
					relative = "cursor",
					prefer_width = 40,
					width = nil,
					max_width = { 140, 0.9 },
					min_width = { 20, 0.2 },
				},
				select = {
					enabled = true,
					backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },
					trim_prompt = true,
					telescope = function()
						local ok, themes = pcall(require, "telescope.themes")
						if ok then
							return themes.get_ivy()
						end
						return {}
					end,
				},
			})
		end,
	},

	-- Fidget - LSP progress notifications
	{
		"j-hui/fidget.nvim",
		event = "LspAttach",
		config = function()
			require("fidget").setup({})
		end,
	},
}
