return {
	-- LSP Config
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Mason setup
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
					"ts_ls",
					"bashls",
					"jsonls",
					"yamlls",
					"terraformls",
					"dockerls",
					-- "rust-analyzer",
				},
				automatic_installation = true,
			})

			-- Global LSP capabilities configuration (v0.11+ style)
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			-- LSP attach configuration (v0.11 style)
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local bufnr = ev.buf
					local client = vim.lsp.get_client_by_id(ev.data.client_id)

					-- Custom keymaps
					local opts = { buffer = bufnr, silent = true }
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "gf", vim.lsp.buf.format, opts)
					vim.keymap.set("n", "ge", vim.diagnostic.open_float, opts)
					vim.keymap.set("n", "g[", vim.diagnostic.goto_prev, opts)
					vim.keymap.set("n", "g]", vim.diagnostic.goto_next, opts)

					-- Auto show diagnostics on cursor hold
					vim.api.nvim_create_autocmd("CursorHold", {
						buffer = bufnr,
						callback = function()
							local diagnostic_opts = {
								focusable = false,
								close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
								border = "rounded",
								source = "always",
								prefix = " ",
								scope = "cursor",
							}
							vim.diagnostic.open_float(nil, diagnostic_opts)
						end,
					})
				end,
			})

			-- Configure diagnostics
			vim.diagnostic.config({
				virtual_text = {
					prefix = "●",
					source = "always",
				},
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "✘",
						[vim.diagnostic.severity.WARN] = "▲",
						[vim.diagnostic.severity.HINT] = "⚑",
						[vim.diagnostic.severity.INFO] = "ℹ",
					},
				},
				underline = true,
				update_in_insert = false,
				severity_sort = true,
				float = {
					focusable = false,
					style = "minimal",
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			})

			-- Configure individual LSP servers
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},
						diagnostics = {
							globals = { "vim" },
							disable = { "missing-fields", "incomplete-signature-doc" },
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						telemetry = {
							enable = false,
						},
					},
				},
			})


			-- configure rust lint
			-- vim.lsp.config("rust-analyzer", {
			-- 	settings = {
			-- 		["rust-analyzer"] = {
			-- 			checkOnSave = {
			-- 				command = "clippy",
			-- 			},
			-- 		},
			-- 	},
			-- })

			-- Enable all configured LSP servers
			vim.lsp.enable({
				"lua_ls",
				"pyright",
				"ts_ls",
				"bashls",
				"jsonls",
				"yamlls",
				"terraformls",
				-- "rust-analyzer",
			})
		end,
	},

	-- Snippets
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local luasnip = require("luasnip")

			-- Load VSCode-style snippets from friendly-snippets
			require("luasnip.loaders.from_vscode").lazy_load()

			-- Load custom snippets
			require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })

			-- Set some basic snippets for testing
			luasnip.add_snippets("javascript", {
				luasnip.snippet("cl", {
					luasnip.text_node("console.log("),
					luasnip.insert_node(1, ""),
					luasnip.text_node(");"),
				}),
				luasnip.snippet("func", {
					luasnip.text_node("function "),
					luasnip.insert_node(1, "name"),
					luasnip.text_node("("),
					luasnip.insert_node(2, ""),
					luasnip.text_node(") {"),
					luasnip.text_node({ "", "  " }),
					luasnip.insert_node(0),
					luasnip.text_node({ "", "}" }),
				}),
			})

			-- Copy to typescript
			luasnip.add_snippets("typescript", luasnip.get_snippets("javascript"))
		end,
	},

	-- Mason integration for linters
	{
		"rshkarin/mason-nvim-lint",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-lint",
		},
		config = function()
			vim.defer_fn(function()
				require("mason-nvim-lint").setup({
					ensure_installed = {
						"luacheck",
						"pylint",
						"eslint_d",
						"shellcheck",
						"markdownlint",
					},
					automatic_installation = true,
					quiet_mode = true,
				})
			end, 1000) -- 1秒遅延
		end,
	},

	-- Mason integration for formatters
	{
		"zapling/mason-conform.nvim",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"stevearc/conform.nvim",
		},
		config = function()
			vim.defer_fn(function()
				require("mason-conform").setup({
					ensure_installed = {
						"stylua",
						"prettier",
						"black",
						"isort",
					},
					automatic_installation = true,
				})
			end, 1500) -- 1.5秒遅延
		end,
	},
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
}
