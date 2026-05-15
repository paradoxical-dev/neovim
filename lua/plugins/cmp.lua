return {
	{
		"saghen/blink.cmp",
		version = "1.*", -- NOTE: Update when v2 is stable
		event = "InsertEnter",
		dependencies = {
			"rafamadriz/friendly-snippets",
			-- {
			-- 	"L3MON4D3/LuaSnip",
			-- 	version = "2.*",
			-- 	dependencies = {
			-- 		"rafamadriz/friendly-snippets",
			-- 	},
			-- 	config = function()
			-- 		require("luasnip.loaders.from_vscode").lazy_load()
			-- 	end,
			-- },
		},
		opts = { -- TODO: add more sources
			keymap = { preset = "enter" },

			-- snippets = { preset = "luasnip" },

			completion = {
				documentation = { auto_show = true },

				trigger = {
					show_on_backspace_in_keyword = true,
					show_on_backspace_after_accept = true,
					show_on_insert = true,
				},

				list = {
					selection = {
						preselect = false,
						auto_insert = true,
					},
				},

				menu = {
					scrollbar = false,
					draw = {
						padding = { 0, 1 }, -- padding only on right side
						components = {
							kind_icon = {
								text = function(ctx)
									return " " .. ctx.kind_icon .. ctx.icon_gap .. " "
								end,
							},
						},
					},
				},
			},

			sources = { default = { "lsp", "path", "snippets", "buffer" } },
		},
		opts_extended = { "sources.default" },
	},
}
