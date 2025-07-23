return {

	--comment
	{
		"echasnovski/mini.comment",
		config = function()
			require("mini.comment").setup({
				options = {
					ignore_blank_line = true,
					custom_comment_empty = false,
					comment_empty = true,
				},
				mappings = {
					comment_line = "<leader>/",
					comment_visual = "<leader>/",
				},
			})
		end,
	},

	--mini.pairs (autopairs alternative)
	{
		"echasnovski/mini.pairs",
		event = "InsertEnter",
		config = function()
			require("mini.pairs").setup({
				modes = { insert = true, command = false, terminal = false },
				mappings = {
					["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
					["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
					["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },
					[")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
					["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
					["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },
					['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\].", register = { cr = false } },
					["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\].", register = { cr = false } },
					["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\].", register = { cr = false } },
				},
			})
		end,
	},

	--mini.surround (surround alternative)
	{
		"echasnovski/mini.surround",
		config = function()
			require("mini.surround").setup({
				mappings = {
					add = "ys",
					delete = "ds",
					find = "",
					find_left = "",
					highlight = "",
					replace = "cs",
					update_n_lines = "",
				},
				search_method = "cover_or_next",
			})
		end,
	},

	--mini.ai (text objects)
	{
		"echasnovski/mini.ai",
		config = function()
			require("mini.ai").setup({
				n_lines = 500,
				custom_textobjects = {
					o = require("mini.ai").gen_spec.treesitter({
						a = { "@block.outer", "@conditional.outer", "@loop.outer" },
						i = { "@block.inner", "@conditional.inner", "@loop.inner" },
					}, {}),
					f = require("mini.ai").gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
					c = require("mini.ai").gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
				},
			})
		end,
	},

	--mini.move (move lines/blocks)
	-- {
	-- 	"echasnovski/mini.move",
	-- 	config = function()
	-- 		require("mini.move").setup({
	-- 			mappings = {
	--          left = "<M-h>",
	-- 				right = "<M-l>",
	-- 				down = "<M-j>",
	-- 				up = "<M-k>",
	-- 				line_left = "<M-h>",
	-- 				line_right = "<M-l>",
	--          line_down = "<M-j>",
	--          line_up = "<M-k>",
	-- 			},
	-- 			options = {
	-- 				reindent_linewise = true,
	-- 			},
	-- 		})
	-- 	end,
	-- },

	--nvim-spider (better word movement)
	{
		"chrisgrieser/nvim-spider",
		config = function()
			vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
			vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
			vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
		end,
	},

	--flash.nvim (easymotion replacement)
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		config = function()
			require("flash").setup({
				labels = "asdfghjklqwertyuiopzxcvbnm",
				search = {
					multi_window = false,
					forward = true,
					wrap = true,
					mode = "fuzzy", -- Change to fuzzy for better character matching
					increment = false,
				},
				jump = {
					jumplist = true,
					pos = "start",
					history = false,
					register = false,
					nohlsearch = false,
					autojump = false,
				},
				label = {
					uppercase = true,
					exclude = "",
					current = true,
					after = true,
					before = false,
					style = "overlay",
					reuse = "lowercase", -- Allow more labels to be available
					min_pattern_length = 0,
					rainbow = {
						enabled = false,
					},
				},
				highlight = {
					backdrop = true,
					matches = true,
					priority = 5000,
					groups = {
						match = "FlashMatch",
						current = "FlashCurrent",
						backdrop = "FlashBackdrop",
						label = "FlashLabel",
					},
				},
				modes = {
					search = {
						enabled = true, -- Enable search mode
					},
					char = {
						enabled = true, -- Enable char mode for single character jumps
						jump_labels = true,
						multi_line = true,
						label = { exclude = "hjkliardc" },
					},
					treesitter = {
						labels = "abcdefghijklmnopqrstuvwxyz",
						jump = { pos = "range" },
						search = { incremental = false },
						label = { before = true, after = true, style = "inline" },
						highlight = {
							backdrop = false,
							matches = false,
						},
					},
				},
			})

			-- Same keybindings as easymotion + additional
			vim.keymap.set("n", "f", function()
				require("flash").jump({ search = { mode = "search", max_length = 1 } })
			end, { desc = "Flash line search" })
			vim.keymap.set("n", "s", function()
				require("flash").jump({ search = { mode = "search", max_length = 2 } })
			end, { desc = "Flash jump" })
			vim.keymap.set("n", "S", function()
				require("flash").treesitter()
			end, { desc = "Flash Treesitter" })
			vim.keymap.set({ "o", "x" }, "r", function()
				require("flash").remote()
			end, { desc = "Remote Flash" })
		end,
	},

	-- nvim-ufo (code folding like VSCode)
	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
		event = "BufReadPost",
		config = function()
			-- Enable fold column for visual indication
			vim.o.foldcolumn = "1"
			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true

			-- Basic fold controls focused on cursor position
			vim.keymap.set("n", "zR", require("ufo").openAllFolds)
			vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
			-- vim.keymap.set('n', 'zr', 'zo', { desc = "Open fold under cursor" })
			-- vim.keymap.set('n', 'zm', 'zc', { desc = "Close fold under cursor" })
			vim.keymap.set("n", "zm", "za", { desc = "Toggle fold under cursor" })

			require("ufo").setup({
				provider_selector = function(bufnr, filetype, buftype)
					return { "treesitter", "indent" }
				end,
				fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
					local newVirtText = {}
					local suffix = ("  %d "):format(endLnum - lnum)
					local sufWidth = vim.fn.strdisplaywidth(suffix)
					local targetWidth = width - sufWidth
					local curWidth = 0
					for _, chunk in ipairs(virtText) do
						local chunkText = chunk[1]
						local chunkWidth = vim.fn.strdisplaywidth(chunkText)
						if targetWidth > curWidth + chunkWidth then
							table.insert(newVirtText, chunk)
						else
							chunkText = truncate(chunkText, targetWidth - curWidth)
							local hlGroup = chunk[2]
							table.insert(newVirtText, { chunkText, hlGroup })
							chunkWidth = vim.fn.strdisplaywidth(chunkText)
							if curWidth + chunkWidth < targetWidth then
								suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
							end
							break
						end
						curWidth = curWidth + chunkWidth
					end
					table.insert(newVirtText, { suffix, "MoreMsg" })
					return newVirtText
				end,
			})
		end,
	},

	--vim-illuminate (highlight same words)
	{
		"RRethy/vim-illuminate",
		config = function()
			require("illuminate").configure({
				providers = {
					"lsp",
					"treesitter",
					"regex",
				},
				delay = 100,
				filetype_overrides = {},
				filetypes_denylist = {
					"dirvish",
					"fugitive",
					"alpha",
					"NvimTree",
					"lazy",
					"neogitstatus",
					"Trouble",
					"lir",
					"Outline",
					"spectre_panel",
					"toggleterm",
					"DressingSelect",
					"TelescopePrompt",
				},
				filetypes_allowlist = {},
				modes_denylist = {},
				modes_allowlist = {},
				providers_regex_syntax_denylist = {},
				providers_regex_syntax_allowlist = {},
				under_cursor = true,
				large_file_cutoff = nil,
				large_file_overrides = nil,
				min_count_to_highlight = 2,
			})

			-- Change highlight colors
			vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#3c3836" })
			vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#3c3836" })
			vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#3c3836" })

			-- Keymaps for navigation
			vim.keymap.set("n", "<M-n>", function()
				require("illuminate").goto_next_reference(false)
			end, { desc = "Next Reference" })

			vim.keymap.set("n", "<M-p>", function()
				require("illuminate").goto_prev_reference(false)
			end, { desc = "Prev Reference" })
		end,
	},
}
