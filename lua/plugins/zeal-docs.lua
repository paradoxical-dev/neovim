return {
	{
		"paradoxical-dev/zeal.nvim",
		lazy = false,
		keys = {
			{
				"<leader>fd",
				function()
					require("zeal").search()
				end,
				desc = "Search Zeal docs",
			},
			{
				"<leader>K",
				function()
					require("zeal").search_ft()
				end,
				desc = "Search Zeal docs for ft",
			},
		},
		opts = {
			browser = "w3m",
			use_toggleterm = true,
			toggleterm = {
				direction = "float",
			},
			picker = {
				type = "snacks",
				snacks = {
					layout = "select",
				},
			},
			ft_map = {
				lua = { "lua_5.1" },
				nix = { "nix_functions_contrib" },
			},
		},
	},
}
