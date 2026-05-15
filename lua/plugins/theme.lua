return {
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
				hl.SnacksIndent = { fg = p.gray1 }
				hl.TabLineSel = { fg = p.white_alt }
				hl.TabLine = { bg = p.black2, fg = p.gray2 }

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

				-- neotree
				hl.NeoTreeNormal = { bg = p.black2 }
				hl.NeoTreeNormalNC = { bg = p.black2 }
				hl.NewTreeTabActive = { bg = p.gray1, fg = p.white3 }
				hl.NewTreeTabInactive = { bg = p.black2, fg = p.gray1 }
				hl.NewTreeTabSeparatorInactive = { bg = p.green.base, fg = p.gray1 }
				hl.NeoTreeDirectoryName = { fg = p.white3 }
				hl.NeoTreeDirectoryIcon = { fg = p.blue1 }
				hl.NeoTreeTabSeparatorActive = { fg = p.gray3 }
				hl.NeoTreeGitModified = { fg = p.yellow.base }
				hl.NeoTreeGitAdded = { fg = p.green.base }
				hl.NeoTreeGitstaged = { fg = p.green.base }
			end,
		},
		config = function(_, opts)
			require("nordic").setup(opts)
			require("nordic").load()
		end,
	},
}
