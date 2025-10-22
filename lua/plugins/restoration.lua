return {
	{
		"paradoxical-dev/restoration.nvim",
		-- lazy = true,
		event = "BufReadPre",
		opts = {
			preserve = {
				breakpoints = true,
				qflist = true,
				undo = true,
				watches = true,
			},
			picker = {
				default = "snacks",
			},
		},
	},
}
