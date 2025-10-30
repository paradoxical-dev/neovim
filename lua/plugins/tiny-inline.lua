return {
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "LspAttach",
		priority = 1000,
		opts = {
			hi = {
				background = "Normal",
			},
			options = {
				multilines = { enabled = true },
			},
		},
	},
}
