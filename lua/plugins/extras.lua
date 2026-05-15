-- INFO: extra plugins not needed, mostlt for fun
-- plugins included:
-- leetcode.nvim
-- typr

return {
	{
		"kawre/leetcode.nvim",
		dependencies = {
			-- "ibhagwan/fzf-lua",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		cmd = "Leet",
		opts = {
			lang = "javascript",
		},
	},

	{
		"nvzone/typr",
		dependencies = "nvzone/volt",
		opts = {
			kblayout = {
				{ "q", "w", "e", "r", "t", "y", "u", "i", "o", "p" },
				{ "a", "s", "d", "f", "g", "h", "j", "k", "l", ";" },
				{ "z", "x", "c", "v", "b", "n", "m", ",", ".", "/" },
			},
		},
		cmd = { "Typr", "TyprStats" },
	},
}
