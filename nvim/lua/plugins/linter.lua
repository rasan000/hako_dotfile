return {
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")

			-- Configure linters for each filetype
			lint.linters_by_ft = {
				lua = { "luacheck" },
				python = { "pylint" },
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				sh = { "shellcheck" },
				bash = { "shellcheck" },
				markdown = { "markdownlint" },
			}

			-- Function to find project root
			local function get_project_root()
				local root_patterns = {
					"package.json",
					".eslintrc.js",
					"eslint.config.js",
					".eslintrc.json",
					"tsconfig.json",
					".git",
				}

				local path = vim.fn.expand("%:p:h")
				local root = vim.fs.find(root_patterns, {
					path = path,
					upward = true,
				})[1]

				if root then
					return vim.fs.dirname(root)
				end
				return vim.fn.getcwd()
			end

			-- Override eslint_d to run from project root
			lint.linters.eslint_d.cmd = function()
				local project_root = get_project_root()
				return { "eslint_d", "--format", "json", "--stdin", "--stdin-filename", vim.fn.expand("%:p") }
			end

			-- Set working directory for eslint_d
			lint.linters.eslint_d.cwd = get_project_root

			-- Configure luacheck for Neovim
			lint.linters.luacheck.args = {
				"--globals", "vim",
				"--read-globals", "vim",
				"--formatter", "plain",
				"--codes",
				"--ranges",
				"-"
			}

			-- Create autocommand for linting
			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})

			-- Manual linting keymap
			vim.keymap.set("n", "<leader>l", function()
				lint.try_lint()
			end, { desc = "Trigger linting for current file" })
		end,
	},
}
