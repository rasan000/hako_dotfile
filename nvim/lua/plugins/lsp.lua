return {
	-- LSP Config
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
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
					"rust-analyzer",
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

			vim.lsp.config("yamlls", {
				settings = {
					yaml = {
						customTags = {
							"!Equals sequence",
							"!FindInMap sequence",
							"!GetAtt scalar",
							"!GetAZs scalar",
							"!ImportValue scalar",
							"!Join sequence",
							"!Ref scalar",
							"!Base64",
							"!Select sequence",
							"!Split sequence",
							"!Sub scalar",
							"!And sequence",
							"!Not sequence",
							"!Sub sequence",
							"!If sequence",
						},
					},
				},
			})

			-- configure rust lint
			vim.lsp.config("rust-analyzer", {
				settings = {
					["rust-analyzer"] = {
						checkOnSave = {
							command = "clippy",
						},
					},
				},
			})

			-- Enable all configured LSP servers
			vim.lsp.enable({
				"lua_ls",
				"pyright",
				"ts_ls",
				"bashls",
				"jsonls",
				"yamlls",
				"terraformls",
				"rust-analyzer",
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

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-d>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-n>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<C-p>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
					{ name = "path" },
				}),
			})
		end,
	},

	-- Mason (LSP installer)
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
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
						"rustfmt",
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
	{ -- optional cmp completion source for require statements and module annotations
		"hrsh7th/nvim-cmp",
		opts = function(_, opts)
			opts.sources = opts.sources or {}
			table.insert(opts.sources, {
				name = "lazydev",
				group_index = 0, -- set group index to 0 to skip loading LuaLS completions
			})
		end,
	},
}
