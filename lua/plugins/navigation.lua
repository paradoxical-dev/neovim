-- INFO: includes packages to imrove navigation and text manipulation
-- plugins included:
-- flash.nvim
-- harpoon
-- nvim-autopairs
-- nvim-rip-substitute
-- nvim-surround
-- snipe.nvim
-- vim-multiple-cursors

return {
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
			{
				"<c-b>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},

	{
		"ThePrimeagen/harpoon",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{
				"<leader>ha",
				function()
					require("harpoon.mark").add_file()
				end,
				desc = "Mark File",
			},
			{
				"<leader>hu",
				function()
					require("harpoon.ui").toggle_quick_menu()
				end,
				desc = "Toggle Menu",
			},
			{
				"<leader>hh",
				function()
					require("harpoon.ui").nav_file(1)
				end,
				desc = "Harpoon 1",
			},
			{
				"<leader>hj",
				function()
					require("harpoon.ui").nav_file(2)
				end,
				desc = "Harpoon 2",
			},
			{
				"<leader>hk",
				function()
					require("harpoon.ui").nav_file(3)
				end,
				desc = "Harpoon 3",
			},
			{
				"<leader>hl",
				function()
					require("harpoon.ui").nav_file(4)
				end,
				desc = "Harpoon 4",
			},
		},
	},

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},

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

	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		opts = {},
	},

	{
		"leath-dub/snipe.nvim",
		keys = {
			{
				"<leader>bs",
				function()
					require("snipe").open_buffer_menu()
				end,
				desc = "Open Snipe",
			},
		},
		opts = {
			ui = {
				max_height = 13,
				open_win_override = {
					border = "rounded",
				},
				position = "bottomright",
			},
		},
	},

	{
		"mg979/vim-visual-multi",
		event = "BufReadPre",
		config = function()
			vim.g.VM_silent_exit = 1
		end,
	},
}
