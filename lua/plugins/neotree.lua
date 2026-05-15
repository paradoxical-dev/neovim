return {
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
}
