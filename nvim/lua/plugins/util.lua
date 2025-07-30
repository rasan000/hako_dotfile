return {

	-- persistence
	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		opts = {
			-- add any custom options here
		},
	},
	--which-key
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 100
		end,
		config = function()
			require("which-key").setup({
				preset = "classic",
				win = {
					border = "rounded",
					width = { min = 20, max = 50 },
					height = { min = 4, max = 20 },
					padding = { 1, 2 },
					row = -2,
					col = -2,
				},
				layout = {
					align = "bottom ",
				},
				spec = {
					{ "<leader>f", group = "+find" },
					{ "<leader>g", group = "+git" },
					{ "<leader>l", group = "+lsp" },
					{ "<leader>n", group = "+noice" },
					{ "<leader>m", group = "+format" },
					{ "<leader>b", group = "+buffer" },
					{ "<leader>w", group = "+window" },
					{ "<leader>t", group = "+toggle" },
					{ "<leader>x", group = "+trouble" },
				},
			})

			-- F1 key for cheat sheet
			vim.keymap.set("n", "<F1>", function()
				local lines = {
					"=== Neovim Cheat Sheet ===",
					"",
					"=== Movement ===",
					"  s           - Flash jump (all screen)",
					"  S           - Flash treesitter jump",
					"  w/e/b       - Spider word movement",
					"  <M-n/p>     - Next/Prev illuminated word",
					"",
					"=== Edit ===",
					'  ys + motion - Add surround (ysiw")',
					'  ds + char   - Delete surround (ds")',
					"  cs + chars  - Change surround (cs\"')",
					"  Visual + S  - Surround selection",
					"  <M-h/j/k/l> - Move lines/blocks",
					"",
					"=== Files ===",
					"  <C-e>       - Toggle file tree",
					"  <leader>ff  - Find files",
					"  <leader>fg  - Live grep",
					"  <leader>fb  - Find buffers",
					"",
					"=== Buffer/Tab ===",
					"  gt/gT       - Next/Prev buffer",
					"  <leader>e   - Close buffer",
					"  <leader>q   - Close all but current",
					"",
					"=== LSP ===",
					"  gd          - Go to definition",
					"  K           - Show hover info",
					"  <leader>rn  - Rename",
					"  <leader>ca  - Code actions",
					"",
					"=== Git ===",
					"  <leader>gs  - Git status",
					"  <leader>gc  - Git commits",
					"",
					"=== Misc ===",
					"  <C-t>       - Toggle terminal",
					"  :Lint   - lint file",
					"  :Format - format file",
					"  <F1>        - This help",
					"",
					"Press 'q' to close",
				}

				local buf = vim.api.nvim_create_buf(false, true)
				vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
				vim.bo[buf].modifiable = false
				vim.bo[buf].filetype = "help"

				local width = 60
				local height = #lines + 2
				local row = math.ceil((vim.o.lines - height) / 2)
				local col = math.ceil((vim.o.columns - width) / 2)

				local opts = {
					relative = "editor",
					width = width,
					height = height,
					row = row,
					col = col,
					style = "minimal",
					border = "rounded",
					title = " Cheat Sheet ",
					title_pos = "center",
				}

				local win = vim.api.nvim_open_win(buf, true, opts)
				vim.wo[win].winhl = "Normal:Normal,FloatBorder:FloatBorder"

				-- Close on q or escape
				vim.api.nvim_buf_set_keymap(buf, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
				vim.api.nvim_buf_set_keymap(buf, "n", "<Esc>", "<cmd>close<CR>", { noremap = true, silent = true })
			end, { desc = "Show cheat sheet" })
		end,
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
