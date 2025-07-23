return {
	--visuals
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		config = function()
			require("noice").setup({
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = false, -- use a classic bottom cmdline for search
					command_palette = false, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
				},
			})

			-- Noice keymaps
			vim.keymap.set("n", "<leader>nh", "<cmd>Noice history<cr>", { desc = "Noice History" })
			vim.keymap.set("n", "<leader>ne", "<cmd>Noice errors<cr>", { desc = "Noice Errors" })
		end,
		opts = {
			-- add any options here
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
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
				direction = "float",
				float_opts = {
					border = "curved",
					width = 150,
					height = 40,
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

	--smooth scrolling
	{
		"karb94/neoscroll.nvim",
		event = "VeryLazy",
		config = function()
			require("neoscroll").setup({
				hide_cursor = true,
				stop_eof = true,
				respect_scrolloff = false,
				cursor_scrolls_alone = true,
				easing_function = "sine",
				pre_hook = nil,
				post_hook = nil,
				performance_mode = false,
				-- Disable default mappings to prevent conflicts
				mappings = {},
			})

			local keymap = {
				["<C-u>"] = function()
					require("neoscroll").ctrl_u({ duration = 100, easing = "sine" })
				end,
				["<C-d>"] = function()
					require("neoscroll").ctrl_d({ duration = 100, easing = "sine" })
				end,
				["<C-b>"] = function()
					require("neoscroll").ctrl_b({ duration = 150, easing = "sine" })
				end,
				["<C-f>"] = function()
					require("neoscroll").ctrl_f({ duration = 150, easing = "sine" })
				end,
				["zt"] = function()
					require("neoscroll").zt({ half_win_duration = 100, easing = "sine" })
				end,
				["zz"] = function()
					require("neoscroll").zz({ half_win_duration = 100, easing = "sine" })
				end,
				["zb"] = function()
					require("neoscroll").zb({ half_win_duration = 100, easing = "sine" })
				end,
			}

			local modes = { "n", "v", "x" }
			for key, func in pairs(keymap) do
				vim.keymap.set(modes, key, func)
			end
		end,
	},
}
