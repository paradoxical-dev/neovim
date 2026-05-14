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
		-- dir = "~/Projects/zeal.nvim",
		-- lazy = false,
		"paradoxical-dev/zeal.nvim",
    event = "VeryLazy",
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
