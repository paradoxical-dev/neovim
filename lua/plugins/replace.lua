return {
	{
		"chrisgrieser/nvim-rip-substitute",
		cmd = "RipSubstitute",
		opts = {},
		keys = {
			{
				"<leader>/",
				function()
					require("rip-substitute").sub()
				end,
				mode = { "n", "x" },
				desc = "Search and Replace",
			},
		},
	},
}
