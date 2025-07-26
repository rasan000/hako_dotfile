return {
	-- git signs
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	--git blame
	{
		"f-person/git-blame.nvim",
		config = function()
			vim.g.gitblame_enabled = false
			vim.api.nvim_set_keymap("n", "<leader>gb", "<Cmd>GitBlameToggle<CR>", {})
		end,
	},
	-- lazy git
	-- nvim v0.8.0
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "gl", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
}
