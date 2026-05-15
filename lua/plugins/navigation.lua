-- INFO: includes packages to imrove navigation and text manipulation
-- plugins included:
-- flash.nvim
-- harpoon
-- nvim-autopairs
-- nvim-neo-tree
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
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{
				"<C-o>",
				"<cmd>Neotree toggle<cr>",
				desc = "Toggle neo-tree",
			},
		},
		opts = {
			close_if_last_window = false,
			enable_git_status = true,
			enable_diagnostics = true,

			source_selector = {
				winbar = true,
			},
			default_component_configs = {
				indent = {
					indent_size = 2,
					padding = 1,
					with_markers = false,
					with_expanders = false,
				},
				icon = {
					folder_closed = "󰉋",
					folder_open = "",
					folder_empty = "",
					default = "󰉋",
				},
				name = {
					trailing_slash = false,
					use_git_status_colors = true,
				},
				diagnostics = {
					symbols = {
						hint = "",
						info = "",
						warn = "",
						error = "",
					},
					highlights = {
						hint = "DiagnosticSignHint",
						info = "DiagnosticSignInfo",
						warn = "DiagnosticSignWarn",
						error = "DiagnosticSignError",
					},
				},
				-- VSCode-style git letters, right-aligned
				git_status = {
					symbols = {
						added = "✚",
						modified = "",
						deleted = "✖",
						renamed = "󰁕",
						-- Status type
						untracked = "",
						ignored = "",
						unstaged = "",
						staged = "",
						conflict = "",
					},
					align = "right",
				},
			},

			renderers = {
				directory = {
					{ "indent" },
					{ "icon" },
					{ "current_filter" },
					{
						"container",
						content = {
							{ "name", zindex = 10 },
							{
								"diagnostics",
								errors_only = true,
								zindex = 20,
								align = "right",
								hide_when_expanded = true,
							},
							{ "git_status", zindex = 10, align = "right", hide_when_expanded = true },
						},
					},
				},
				file = {
					{ "indent" },
					{ "icon" },
					{
						"container",
						content = {
							{ "name", zindex = 10 },
							{ "diagnostics", zindex = 20, align = "right" },
							{ "git_status", zindex = 10, align = "right" },
						},
					},
				},
			},

			filesystem = {
				filtered_items = {
					visible = false,
					hide_dotfiles = false,
					hide_gitignored = true,
				},
				follow_current_file = {
					enabled = true,
				},
				use_libuv_file_watcher = true,
				hijack_netrw_behavior = "open_default",
			},

			window = {
				position = "left",
				width = 35,
				mappings = {
					["<C-t>"] = "navigate_up",
					["?"] = "show_help",
				},
			},
		},
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
