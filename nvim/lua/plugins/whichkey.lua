return {
	--which-key
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 500
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
}
