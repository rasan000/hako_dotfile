return {
	--visuals
	--float command and messages
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				cmdline = {
					enabled = true,
					view = "cmdline", -- Use bottom cmdline instead of popup
					opts = {},
				},
				popupmenu = {
					enabled = true,
					backend = "nui", -- Modern popup menu
					kind_icons = {},
				},
				messages = {
					enabled = true,
					view = "notify", -- Use notifications for messages
					view_error = "notify",
					view_warn = "notify",
					view_history = "messages",
					view_search = false, -- Use default search display
				},
				lsp = {
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
					hover = {
						enabled = true,
						silent = false,
						view = nil,
						opts = {},
					},
					signature = {
						enabled = true,
						auto_open = {
							enabled = true,
							trigger = true,
							luasnip = true,
							throttle = 50,
						},
						view = nil,
						opts = {},
					},
					message = {
						enabled = true,
						view = "notify",
						opts = {},
					},
					documentation = {
						view = "hover",
						opts = {
							lang = "markdown",
							replace = true,
							render = "plain",
							format = { "{message}" },
							win_options = { concealcursor = "n", conceallevel = 3 },
						},
					},
				},
				presets = {
					bottom_search = true, -- Classic search at bottom
					command_palette = false, -- Keep cmdline at bottom
					long_message_to_split = true, -- Long messages in split
					inc_rename = false,
					lsp_doc_border = true, -- Bordered LSP docs
				},
			})

			-- Configure nvim-notify for better floating notifications
			require("notify").setup({
				background_colour = "#000000",
				timeout = 3000,
				top_down = false,
				render = "compact",
				stages = "fade_in_slide_out",
				minimum_width = 50,
				maximum_width = 80,
			})

			-- message history
			vim.keymap.set("n", "<leader>nl", "<cmd>Noice last<CR>")
			vim.keymap.set("n", "<leader>nh", "<cmd>Noice history<CR>")
			vim.keymap.set("n", "<leader>nd", "<cmd>Noice dismiss<CR>")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			require("ibl").setup({
				indent = {
					char = "│",
					tab_char = "│",
				},
				scope = {
					enabled = true,
					show_start = true,
					show_end = false,
				},
				exclude = {
					filetypes = {
						"help",
						"alpha",
						"dashboard",
						"neo-tree",
						"Trouble",
						"trouble",
						"lazy",
						"mason",
						"notify",
						"toggleterm",
						"lazyterm",
					},
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
