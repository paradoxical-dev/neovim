return {
	-- {
	-- 	-- OLDWORLD
	-- 	"dgox16/oldworld.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("oldworld").setup({
	-- 			variant = "oled",
	-- 			highlight_overrides = {
	-- 				-- UI
	-- 				WinBar = { bg = "none" },
	-- 				WinBarNC = { bg = "none" },
	-- 				Normal = { bg = "none" },
	-- 				NormalNC = { bg = "none" },
	--
	-- 				-- GITSIGNS
	-- 				GitSignsAdd = { fg = "#90b99f" },
	-- 				GitSignsChange = { fg = "#e6b99d" },
	-- 				GitSignsDelete = { fg = "#ea83a5" },
	-- 				["GitSignsBlameColor.2ee"] = { fg = "#85b5ba" },
	-- 				["GitSignsBlameColor.33a"] = { link = "Keyword" },
	-- 				["GitSignsBlameColor.4ee"] = { fg = "#85b5ba" },
	-- 				["GitSignsBlameColor.5d7"] = { link = "Number" },
	-- 				["GitSignsBlameColor.610"] = { link = "Type" },
	-- 				["GitSignsBlameColor.73e"] = { link = "Function" },
	-- 				["GitSignsBlameColor.811"] = { link = "Type" },
	-- 				["GitSignsBlameColor.c3b"] = { link = "String" },
	-- 				["GitSignsBlameColor.feb"] = { link = "String" },
	--
	-- 				-- STATUS LINE
	-- 				HeirlineNormal = { fg = "#e29eca", bg = "#e29eca" },
	-- 				HeirlineVisual = { fg = "#ACA1CF", bg = "#ACA1CF" },
	-- 				HeirlineInsert = { fg = "#90b99f", bg = "#90b99f" },
	-- 				HeirlineCommand = { fg = "#F5a991", bg = "#F5a991" },
	-- 				HeirlineTerminal = { fg = "#90b99f", bg = "#90b99f" },
	-- 				HeirlineReplace = { fg = "#92a2d5", bg = "#92a2d5" },
	-- 				HeirlineInactive = { fg = "#777777", bg = "#777777" },
	-- 			},
	-- 		})
	-- 		vim.cmd("colorscheme oldworld")
	-- 	end,
	--    }

	-- EVERFOREST
	-- {
	-- 	"neanias/everforest-nvim",
	-- 	version = false,
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("everforest").setup({
	-- 			background = "hard",
	-- 			on_highlights = function(hl, p)
	-- 				hl.HeirlineNormal = { fg = p.aqua, bg = p.aqua }
	-- 				hl.HeirlineVisual = { fg = p.green, bg = p.green }
	-- 				hl.HeirlineInsert = { fg = p.yellow, bg = p.yellow }
	-- 				hl.HeirlineCommand = { fg = p.purple, bg = p.purple }
	-- 				hl.HeirlineTerminal = { fg = p.green, bg = p.green }
	-- 				hl.HeirlineReplace = { fg = p.red, bg = p.red }
	-- 				hl.HeirlineInactive = { fg = "#777777", bg = "#777777" }
	-- 				hl.StatusLine = { bg = "none" }
	-- 				hl.WinBar = { bg = "none" }
	-- 				hl.WinBarNC = { bg = "none" }
	-- 				hl.Normal = { bg = "none" }
	-- 				hl.NormalNC = { bg = "none" }
	-- 			end,
	-- 		})
	-- 		vim.cmd("colorscheme everforest")
	-- 	end,
	-- },

	-- NORD
	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			bold_keywords = true,
			transparent = {
				bg = true,
				-- float = true,
			},
			on_highlight = function(hl, p)
				-- statusline
				hl.HeirlineNormal = { fg = p.blue2, bg = p.blue2 }
				hl.HeirlineVisual = { fg = p.orange.base, bg = p.orange.base }
				hl.HeirlineInsert = { fg = p.cyan.base, bg = p.cyan.base }
				hl.HeirlineCommand = { fg = p.yellow.base, bg = p.yellow.base }
				hl.HeirlineTerminal = { fg = p.green.base, bg = p.green.base }
				hl.HeirlineReplace = { fg = p.red.base, bg = p.red.base }
				hl.HeirlineInactive = { fg = "#777777", bg = "#777777" }

				-- ui
				hl.StatusLine = { bg = "none" }
				hl.NvimTreeNormal = { bg = p.black2 }
				hl.NvimTreeNormalNC = { bg = p.black2 }
				hl.SnacksIndent = { fg = p.gray1 }

				-- syntax
				hl.Comment = { fg = p.gray4 }

				-- cmp
				hl.BlinkCmpKindClass = { fg = p.black1, bg = p.yellow.base }
				hl.BlinkCmpKindStruct = { fg = p.black1, bg = p.yellow.base }
				hl.BlinkCmpKindModule = { fg = p.black1, bg = p.yellow.base }
				hl.BlinkCmpKindInterface = { fg = p.black1, bg = p.yellow.base }
				hl.BlinkCmpKindTypeParameter = { fg = p.black1, bg = p.yellow.base }
				hl.BlinkCmpKindEnumMember = { fg = p.black1, bg = p.yellow.base }
				hl.BlinkCmpKindEnum = { fg = p.black1, bg = p.yellow.base }
				hl.BlinkCmpKindEvent = { fg = p.black1, bg = p.yellow.base }

				hl.BlinkCmpKindUnit = { fg = p.black1, bg = p.magenta.base }
				hl.BlinkCmpKindColor = { fg = p.black1, bg = p.magenta.base }
				hl.BlinkCmpKindValue = { fg = p.black1, bg = p.magenta.base }
				hl.BlinkCmpKindConstant = { fg = p.black1, bg = p.magenta.base }

				hl.BlinkCmpKindConstructor = { fg = p.black1, bg = p.blue2 }
				hl.BlinkCmpKindMethod = { fg = p.black1, bg = p.blue2 }
				hl.BlinkCmpKindFunction = { fg = p.black1, bg = p.blue2 }

				hl.BlinkCmpKindVariable = { fg = p.black1, bg = p.cyan.base }
				hl.BlinkCmpKindReference = { fg = p.black1, bg = p.cyan.base }
				hl.BlinkCmpKindField = { fg = p.black1, bg = p.cyan.base }
				hl.BlinkCmpKindProperty = { fg = p.black1, bg = p.cyan.base }

				hl.BlinkCmpKindKeyword = { fg = p.black1, bg = p.blue2 }
				hl.BlinkCmpKindOperator = { fg = p.black1, bg = p.blue2 }

				hl.BlinkCmpKindSnippet = { fg = p.black1, bg = p.orange.base }

				hl.BlinkCmpKindFolder = { fg = p.black1, bg = p.green.base }
				hl.BlinkCmpKindFile = { fg = p.black1, bg = p.green.base }

				hl.BlinkCmpKindText = { fg = p.black1, bg = p.gray5 }

				hl.BlinkCmpKindTabNine = { fg = p.black1, bg = p.red.base }
				hl.BlinkCmpKindCopilot = { fg = p.black1, bg = p.red.base }
			end,
		},
		config = function(_, opts)
			require("nordic").setup(opts)
			require("nordic").load()
		end,
	},

	-- ROSE PINE
	-- {
	-- 	"rose-pine/neovim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("rose-pine").setup({
	-- 			variant = "main",
	-- 			styles = {
	-- 				italic = false,
	-- 				-- transparency = true,
	-- 			},
	-- 			palette = {
	-- 				main = {
	-- 					base = "#0c0c15",
	-- 					mantle = "#08080f",
	-- 					crust = "#0b0b12",
	-- 					-- gold = "#f9e2af"
	-- 				},
	-- 			},
	-- 			highlight_groups = {
	-- 				-- UI
	-- 				WinBar = { bg = "base" },
	-- 				WinBarNC = { bg = "base" },
	-- 				WinSeparator = { bg = "base" },
	-- 				NormalFloat = { bg = "mantle" },
	-- 				FloatBorder = { bg = "mantle", fg = "mantle" },
	-- 				FloatTitle = { bg = "#2b3435", fg = "foam", italic = true },
	-- 				StatusLine = { bg = "none" },
	-- 				StatusLineTerm = { bg = "none" },
	-- 				StatusLineTermNC = { bg = "none" },
	-- 				LineNr = { fg = "text", bold = true },
	-- 				LineNrAbove = { fg = "muted" },
	-- 				LineNrBelow = { fg = "muted" },
	-- 				EndOfBuffer = { fg = "#000000" },
	--
	-- 				-- SYNTAX
	-- 				Keyword = { italic = true },
	-- 				["@variable"] = { bold = true },
	-- 				["@property"] = { fg = "#d2cbe7" },
	-- 				Comment = { fg = "muted", italic = true },
	--
	-- 				-- STATUS
	-- 				HeirlineNormal = { fg = "love", bg = "love" },
	-- 				HeirlineVisual = { fg = "iris", bg = "iris" },
	-- 				HeirlineInsert = { fg = "foam", bg = "foam" },
	-- 				HeirlineCommand = { fg = "gold", bg = "gold" },
	-- 				HeirlineTerminal = { fg = "rose", bg = "rose" },
	-- 				HeirlineReplace = { fg = "pine", bg = "pine" },
	-- 				HeirlineInactive = { fg = "#777777", bg = "#777777" },
	--
	-- 				-- CMP
	-- 				CmpItemKind = { bg = "love", fg = "base" },
	-- 				CmpItemKindConstructor = { bg = "love", fg = "base" },
	-- 				CmpItemKindTypeParameter = { bg = "love", fg = "base" },
	-- 				CmpItemKindOperator = { bg = "love", fg = "base" },
	-- 				CmpItemKindEvent = { bg = "love", fg = "base" },
	-- 				CmpItemKindMethod = { bg = "love", fg = "base" },
	-- 				CmpItemKindStruct = { bg = "love", fg = "base" },
	-- 				CmpItemKindEnum = { bg = "iris", fg = "base" },
	-- 				CmpItemKindFile = { bg = "iris", fg = "base" },
	-- 				CmpItemKindField = { bg = "iris", fg = "base" },
	-- 				CmpItemKindUnit = { bg = "iris", fg = "base" },
	-- 				CmpItemKindKeyword = { bg = "iris", fg = "base" },
	-- 				CmpItemKindVariable = { bg = "iris", fg = "base" },
	-- 				CmpItemKindText = { bg = "foam", fg = "base" },
	-- 				CmpItemKindInterface = { bg = "foam", fg = "base" },
	-- 				CmpItemKindClass = { bg = "foam", fg = "base" },
	-- 				CmpItemKindDefault = { bg = "foam", fg = "base" },
	-- 				CmpItemKindProperty = { bg = "foam", fg = "base" },
	-- 				CmpItemKindColor = { bg = "rose", fg = "base" },
	-- 				CmpItemKindReference = { bg = "rose", fg = "base" },
	-- 				CmpItemKindEnumMember = { bg = "rose", fg = "base" },
	-- 				CmpItemKindFolder = { bg = "rose", fg = "base" },
	-- 				CmpItemKindSnippet = { bg = "rose", fg = "base" },
	-- 				CmpItemKindValue = { bg = "pine", fg = "base" },
	-- 				CmpItemKindConstant = { bg = "pine", fg = "base" },
	-- 				CmpItemKindCopilot = { bg = "pine", fg = "base" },
	-- 				CmpItemKindModule = { bg = "pine", fg = "base" },
	-- 				CmpItemKindFunction = { bg = "pine", fg = "base" },
	-- 				CmpItemKindFunctionDefault = { bg = "pine", fg = "base" },
	--
	-- 				-- NVIMTREE
	-- 				NvimTreeNormal = { bg = "mantle" },
	-- 				NvimTreeWinSeparator = { fg = "base" },
	--
	-- 				-- SNACKS
	-- 				SnacksIndent = { fg = "base" },
	-- 				SnacksIndentChunk = { fg = "foam" },
	-- 				SnacksDashboardDesc = { fg = "muted", bold = true },
	-- 				SnacksDashboardIcon = { fg = "muted", bold = true, italic = true },
	-- 				SnacksDashboardKey = { fg = "muted", bold = true },
	-- 				SnacksDashboardFooter = { fg = "foam", italic = true },
	--
	-- 				-- WHICHKEY
	-- 				WhichKeyBorder = { link = "FloatBorder" },
	-- 				WhichKeyDesc = { fg = "text" },
	-- 				WhichKeyGroup = { fg = "foam", italic = true },
	-- 			},
	-- 		})
	-- 		vim.cmd("colorscheme rose-pine")
	-- 	end,
	-- },

	-- CUSTOM CATPPUCCIN
	-- {
	-- 	"catppuccin/nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {
	-- 		flavour = "mocha",
	-- 		color_overrides = {
	-- 			mocha = {
	-- 				rosewater = "#f4e0dd",
	-- 				flamingo = "#edcfcf",
	-- 				pink = "#edc7e2",
	-- 				mauve = "#cabaee",
	-- 				red = "#e595aa",
	-- 				maroon = "#e0a6af",
	-- 				peach = "#e2bbae",
	-- 				yellow = "#f9e2af",
	-- 				green = "#b4dbc8",
	-- 				teal = "#a9ddd4",
	-- 				sky = "#9fd8e2",
	-- 				sapphire = "#84c5e3",
	-- 				blue = "#9cb4dc",
	-- 				lavender = "#b8c0ee",
	-- 				text = "#cdd6f4",
	-- 				subtext1 = "#bac2de",
	-- 				subtext0 = "#a6adc8",
	-- 				overlay2 = "#9399b2",
	-- 				overlay1 = "#7f849c",
	-- 				overlay0 = "#6c7086",
	-- 				surface2 = "#585b70",
	-- 				surface1 = "#45475a",
	-- 				surface0 = "#313244",
	-- 				base = "#0c0c15",
	-- 				mantle = "#08080f",
	-- 				crust = "#0b0b12",
	-- 			},
	-- 		},
	-- 		highlight_overrides = {
	-- 			mocha = function(c)
	-- 				return {
	-- 					-- STATUS
	-- 					HeirlineNormal = { fg = c.lavender, bg = c.lavender },
	-- 					HeirlineVisual = { fg = c.yellow, bg = c.yellow },
	-- 					HeirlineInsert = { fg = c.rosewater, bg = c.rosewater },
	-- 					HeirlineCommand = { fg = c.rosewater, bg = c.rosewater },
	-- 					HeirlineTerminal = { fg = c.yellow, bg = c.yellow },
	-- 					HeirlineReplace = { fg = c.red, bg = c.red },
	-- 					HeirlineInactive = { fg = "#777777", bg = "#777777" },
	--
	-- 					-- SYNTAX
	-- 					-- String = { fg = c.yellow },
	-- 					-- String = { fg = c.subtext1 },
	-- 					-- Function = { fg = c.lavender },
	-- 					-- ["@function.builtin"] = { fg = c.lavender },
	-- 					-- ["@keyword.function"] = { fg = c.green },
	-- 					-- ["@keyword.return"] = { fg = c.green },
	--
	-- 					SnacksIndent = { fg = c.mantle },
	-- 					SnacksIndentChunk = { fg = c.blue },
	-- 				}
	-- 			end,
	-- 		},
	-- 	},
	-- 	config = function(_, opts)
	-- 		require("catppuccin").setup(opts)
	-- 		vim.cmd("colorscheme catppuccin")
	-- 	end,
	-- },
}
