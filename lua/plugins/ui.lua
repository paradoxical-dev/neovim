-- INFO: includes packages to enhance neovim's ui
-- plugins included:
-- dressing.nvim
-- markview.nvim
-- minty
-- nvim-colorizer
-- noice.nvim
-- nvim-notify
-- todo-comments.nvim

local function concat_message(x)
	local str = table.concat(x, "\n")
	return str
end

local function get_items(history)
	local items = {}
	for _, item in pairs(history) do
		local level = item.level
		local icon = item.icon
		local message = concat_message(item.message)

		table.insert(items, {
			text = icon .. "  " .. level .. ":  " .. message,
			level = level,
			icon = icon,
			message = message,
			preview = {
				text = message,
				ft = "markdown",
			},
		})
	end
	return items
end

local function format_line(item)
	return {
		{ string.format("%-4s", item.icon), "Notify" .. item.level .. "Icon" },
		{ string.format("%-6s", item.level), "Notify" .. item.level .. "Icon" },
		{ item.message, "SnacksPickerBold" },
	}
end

return {
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		opts = {
			input = {
				max_width = { 100, 0.7 },
				min_width = { 20, 0.2 },
			},
			select = {
				fzf_lua = {
					winopts = {
						height = 0.4,
						width = 0.3,
					},
				},
			},
		},
	},

	{
		"OXY2DEV/markview.nvim",
		event = "VeryLazy",
		-- lazy = false,
		-- ft = { "markdown", "yaml" },
		opts = {},
	},

	{
		"nvzone/minty",
		dependencies = { "nvzone/volt" },
		lazy = true,
		keys = {
			{
				"<leader>S",
				"<cmd>Shades<cr>",
				desc = "Shades Color Picker",
			},
			{
				"<leader>H",
				"<cmd>Huefy<cr>",
				desc = "Huefy Color Picker",
			},
		},
	},

	{
		"norcalli/nvim-colorizer.lua",
		event = "BufReadPre",
		config = function()
			require("colorizer").setup()
		end,
	},

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				bottom_search = true,
				-- command_palette = true,
				long_message_to_split = true,
				inc_rename = false,
				lsp_doc_border = false,
			},
			views = {
				cmdline_popup = {
					position = { row = 5, col = "50%" },
					size = { width = 60, height = "auto" },
					border = { style = "none", padding = { 1, 2 } },
					win_options = {
						winhighlight = { Normal = "NormalFloat" },
					},
				},
				popupmenu = {
					relative = "editor",
					position = { row = 8, col = "50%" },
					size = { width = 60, height = 10 },
					border = {
						style = "none",
						padding = { 1, 2 },
					},
					win_options = {
						winhighlight = { Normal = "NormalFloat" },
					},
				},
			},
		},
	},

	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		keys = {
			{
				"<leader>fn",
				function()
					local history = require("notify").history()
					Snacks.picker({
						title = "Notifications",
						items = get_items(history),
						format = format_line,
						layout = {
							preview = true,
							layout = {
								backdrop = false,
								width = 0.6,
								min_width = 80,
								height = 0.8,
								min_height = 30,
								box = "vertical",
								border = true,
								title = "{title} {live} {flags}",
								title_pos = "center",
								{ win = "preview", title = "{preview}", height = 0.7, border = "none" },
								{ win = "input", height = 1, border = "none" },
								{ win = "list", border = "none" },
							},
						},
						preview = function(ctx)
							ctx.preview:reset()
							ctx.preview:wo({ wrap = true, number = false, relativenumber = false })
							local lines = vim.split(ctx.item.preview.text, "\n")
							ctx.preview:set_lines(lines)
							ctx.preview:highlight({ ft = "markdown" })
						end,
					})
				end,
				desc = "Browse Notify History",
			},
		},
		opts = function(_, opts)
			vim.notify = require("notify")
			return {
				background_colour = "#000000",
			}
		end,
	},

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "BufReadPre",
		keys = {
			{
				"]t",
				function()
					require("todo-comments").jump_next()
				end,
				desc = "Next todo comment",
			},
			{
				"[t",
				function()
					require("todo-comments").jump_prev()
				end,
				desc = "Previous todo comment",
			},
		},
		opts = {},
	},
}
