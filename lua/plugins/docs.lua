return {
  {
    'emmanueltouzery/apidocs.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-telescope/telescope.nvim', -- or, 'folke/snacks.nvim'
    },
    cmd = { 'ApidocsSearch', 'ApidocsInstall', 'ApidocsOpen', 'ApidocsSelect', 'ApidocsUninstall' },
    config = function()
      require('apidocs').setup()
    end,
  },

	{
		"paradoxical-dev/zeal.nvim",
		-- dir = "~/Projects/zeal.nvim",
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
					local query = vim.fn.expand("<cword>")
					require("zeal").search_ft(query)
				end,
				desc = "Search Zeal docs for ft",
			},
		},
		opts = {
			-- browser = { "w3m" },
			use_toggleterm = true,
			-- use_toggleterm = false,
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
