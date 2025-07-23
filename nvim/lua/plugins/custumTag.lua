return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				yamlls = {
					settings = {
						yaml = {
							customTags = {
								"!fn",
								"!And",
								"!If",
								"!Not",
								"!Equals",
								"!Or",
								"!FindInMap sequence",
								"!Base64",
								"!Cidr",
								"!Ref",
								"!Ref Scalar",
								"!Sub",
								"!GetAtt",
								"!GetAZs",
								"!ImportValue",
								"!Select",
								"!Split",
								"!Join sequence",
							},
						},
					},
				},
			},
		},
	},
}
