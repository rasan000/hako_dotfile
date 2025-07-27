return {
	-- copilot.lua (better than copilot.vim)
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				panel = {
					enabled = true,
					auto_refresh = false,
					keymap = {
						jump_prev = "[[",
						jump_next = "]]",
						accept = "<CR>",
						refresh = "<C-r>",
						open = "<C-CR>",
					},
					layout = {
						position = "bottom", -- | top | left | right
						ratio = 0.4,
					},
				},
				suggestion = {
					enabled = true,
					auto_trigger = true,
					debounce = 75,
					keymap = {
						accept = "<C-e>",
						accept_word = false,
						accept_line = false,
						next = "<M-]>",
						prev = "<M-[>",
						dismiss = "<C-w>",
					},
				},
				filetypes = {
					yaml = false,
					markdown = false,
					help = false,
					gitcommit = false,
					gitrebase = false,
					hgcommit = false,
					svn = false,
					cvs = false,
					["."] = false,
				},
				copilot_node_command = "node", -- Node.js version must be > 18.x
				server_opts_overrides = {},
			})
		end,
	},

	-- copilot-cmp integration
	{
		"zbirenbaum/copilot-cmp",
		dependencies = { "zbirenbaum/copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	},

	-- CopilotChat
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "zbirenbaum/copilot.lua" },
			{ "nvim-lua/plenary.nvim" },
		},
		config = function()
			require("CopilotChat").setup()

			-- Key mappings for CopilotChat
			vim.api.nvim_set_keymap("n", "<leader>cc", "<cmd>CopilotChat<CR>", { noremap = true, silent = true })
		end,
	},

	-- Add copilot toggle functionality
	{
		"nvim-lua/plenary.nvim",
		config = function()
			-- Global variable to track auto_trigger state
			_G.copilot_auto_trigger = true

			-- Function to toggle copilot auto trigger
			_G.toggle_copilot_auto_trigger = function()
				local copilot = require("copilot.suggestion")
				_G.copilot_auto_trigger = not _G.copilot_auto_trigger

				if _G.copilot_auto_trigger then
					copilot.toggle_auto_trigger()
					vim.notify("Copilot auto suggestions enabled", vim.log.levels.INFO)
				else
					copilot.toggle_auto_trigger()
					vim.notify("Copilot auto suggestions disabled", vim.log.levels.INFO)
				end
			end

			-- User command for toggling
			vim.api.nvim_create_user_command("CopilotToggle", function()
				_G.toggle_copilot_auto_trigger()
			end, { desc = "Toggle Copilot auto trigger" })

			-- toggle command
			vim.keymap.set("n", "<leader>ct", "<Cmd>CopilotToggle<CR>", {})
		end,
	},
}
