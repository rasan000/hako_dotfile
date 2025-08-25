return {
	-- lualine
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				theme = "nightfox",
				globalstatus = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { "filename" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		},
	},
	-- color scheme
	{
		"EdenEast/nightfox.nvim",
		opts = {
			options = {
				transparent = false,
				styles = {
					comments = "italic",
					keywords = "bold",
					type = "italic,bold",
				},
			},
		},
		config = function()
			vim.cmd("colorscheme nightfox") -- or any other nightfox variant
		end,
	},
	-- nvim-web-devicons (use basic ASCII icons for compatibility)
	{
		"nvim-tree/nvim-web-devicons",
		opts = {
			color_icons = true,
			default = true,
			strict = false,
		},
	},
}
