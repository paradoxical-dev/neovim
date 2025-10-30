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
}
