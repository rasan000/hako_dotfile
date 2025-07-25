return {
	--	color scheme
	-- {
	-- 	"EdenEast/nightfox.nvim",
	-- 	config = function()
	-- 		require("nightfox").setup({
	-- 			options = {
	-- 				transparent = true,
	-- 				styles = {
	-- 					comments = "italic",
	-- 					keywords = "bold",
	-- 					type = "italic,bold",
	-- 				},
	-- 			},
	-- 		})
	-- 		vim.cmd("colorscheme nordfox")
	-- 	end,
	-- },
	{
		"sainnhe/everforest",
		priority = 1000,
		config = function()
			vim.g.everforest_background = "Hard"
			vim.g.everforest_better_performance = 1
			vim.g.everforest_transparent_background = 1
			vim.g.everforest_enable_italic = 1
			vim.cmd("colorscheme everforest")
		end,
	},
	-- nvim-web-devicons (use basic ASCII icons for compatibility)
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup({
				override = {
					zsh = {
						icon = "Z",
						color = "#428850",
						cterm_color = "65",
						name = "Zsh",
					},
					lua = {
						icon = "L",
						color = "#51a0cf",
						cterm_color = "74",
						name = "Lua",
					},
					js = {
						icon = "J",
						color = "#cbcb41",
						cterm_color = "185",
						name = "Js",
					},
					ts = {
						icon = "T",
						color = "#519aba",
						cterm_color = "67",
						name = "Ts",
					},
					md = {
						icon = "M",
						color = "#519aba",
						cterm_color = "67",
						name = "Markdown",
					},
					txt = {
						icon = "F",
						color = "#89e051",
						cterm_color = "113",
						name = "Text",
					},
					py = {
						icon = "P",
						color = "#3572A5",
						cterm_color = "61",
						name = "Python",
					},
					vim = {
						icon = "V",
						color = "#019833",
						cterm_color = "28",
						name = "Vim",
					},
				},
				color_icons = true,
				default = true,
				strict = false,
				override_by_filename = {
					[".gitignore"] = {
						icon = "G",
						color = "#f1502f",
						name = "Gitignore",
					},
					[".gitconfig"] = {
						icon = "C",
						color = "#f1502f",
						name = "Gitconfig",
					},
					["Makefile"] = {
						icon = "M",
						color = "#427819",
						name = "Makefile",
					},
					["README.md"] = {
						icon = "R",
						color = "#519aba",
						name = "Readme",
					},
					["package.json"] = {
						icon = "N",
						color = "#e8274b",
						name = "PackageJson",
					},
				},
				override_by_extension = {
					["log"] = {
						icon = "L",
						color = "#81e043",
						name = "Log",
					},
					["conf"] = {
						icon = "C",
						color = "#6d8086",
						name = "Conf",
					},
					["yaml"] = {
						icon = "Y",
						color = "#cb171e",
						name = "Yaml",
					},
					["yml"] = {
						icon = "Y",
						color = "#cb171e",
						name = "Yml",
					},
				},
			})
		end,
	},

	-- lualine
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "auto",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { "filename" },
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
			})
		end,
	},
}
