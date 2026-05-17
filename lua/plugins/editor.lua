-- INFO: enahnces the core editor abilites
-- plugins included:
-- vim-dadbod
-- jupynvim
-- kulala.nvim
-- nvim-neotest

return {
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod", cmd = { "DB" }, lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true }, -- Optional
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			vim.g.db_ui_use_nerd_fonts = 1
			vim.g.db_ui_save_location = "~/.local/share/nvim/dadbod/connections"
		end,
	},

	{
		"sheng-tse/jupynvim",
		build = function(plugin)
			local install = loadfile(plugin.dir .. "/lua/jupynvim/install.lua")()
			install.run(plugin)
		end,
		config = function()
			require("jupynvim").setup({
				log_level = "info",
				image_renderer = "kitty", -- "placeholder", "kitty", or "chafa"
			})
		end,
	},

	{
		{
			"mistweaverco/kulala.nvim",
			event = { "BufReadPre" },
			ft = { "http", "rest" },
			keys = {
				{
					"<leader>rr",
					function()
						require("kulala").run()
					end,
					desc = "Run Current Request",
				},
				{
					"<leader>rR",
					function()
						require("kulala").run_all()
					end,
					desc = "Run Current Buffer",
				},
				{
					"<leader>rl",
					function()
						require("kulala").replay()
					end,
					desc = "Replay Last Request",
				},
				{
					"<leader>ri",
					function()
						require("kulala").inspect()
					end,
					desc = "Inspect Request",
				},
				{
					"<leader>rS",
					function()
						require("kulala").show_stats()
					end,
					desc = "Last Run Stats",
				},
				{
					"<leader>rs",
					function()
						require("kulala").scratchpad()
					end,
					desc = "Scratchpad",
				},
				{
					"<leader>rc",
					function()
						require("kulala").copy()
					end,
					desc = "Request To Curl",
				},
				{
					"<leader>rC",
					function()
						require("kulala").from_curl()
					end,
					desc = "Curl To Request",
				},
				{
					"<leader>rt",
					function()
						require("kulala").toggle_view()
					end,
					desc = "Toggle Res Panel",
				},
				{
					"<leader>r/",
					function()
						require("kulala").search()
					end,
					desc = "Search Requests",
				},
				{
					"<leader>r]",
					function()
						require("kulala").jump_next()
					end,
					desc = "Next Request",
				},
				{
					"<leader>r[",
					function()
						require("kulala").jump_prev()
					end,
					desc = "Previous Request",
				},
				{
					"<leader>rx",
					function()
						require("kulala").clear_cached_files()
					end,
					desc = "Clear Cache",
				},
			},
			opts = function()
				vim.filetype.add({
					extension = {
						["http"] = "http",
					},
				})
				return {
					display_mode = "split",
					default_view = "verbose",
				}
			end,
		},
	},

	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",

			-- adapters
			"nvim-neotest/neotest-python",
		},
		-- event = "BufReadPre",
		keys = {
			{
				"<leader>xx",
				function()
					require("neotest").run.run()
				end,
				desc = "Run nearest test",
			},
			{
				"<leader>xX",
				function()
					require("neotest").run.run(vim.fn.expand("%"))
				end,
				desc = "Run tests in current file",
			},
			{
				"<leader>xl",
				function()
					require("neotest").run.run_last()
				end,
				desc = "Re-run last test",
			},
			{
				"<leader>xL",
				function()
					require("neotest").run.run_last({ strategy = "dap" })
				end,
				desc = "Re-run last test in debug mode",
			},
			{
				"<leader>xd",
				function()
					require("neotest").run.run({ strategy = "dap" })
				end,
				desc = "Run nearest test in debug mode",
			},
			{
				"<leader>xD",
				function()
					require("neotest").run.run(vim.fn.expand("%"), { strategy = "dap" })
				end,
				desc = "Run current file in debug mode",
			},
			{
				"<leadeer>xs",
				function()
					require("neotest").run.stop()
				end,
				desc = "Stop nearest test",
			},
			{
				"<leader>xa",
				function()
					require("neotest").run.attach()
				end,
				desc = "Attach to nearest test",
			},
			{
				"<leader>xw",
				function()
					require("neotest").watch.toggle(vim.fn.expand("%"))
				end,
				desc = "Toggle current file watch",
			},
			{
				"<leader>xW",
				function()
					require("neotest").watch.toggle(vim.fn.expand("%:h"))
				end,
				desc = "Toggle parent dir watch",
			},
			{
				"<leader>xs",
				function()
					require("neotest").summary.toggle()
				end,
				desc = "Toggle summary",
			},
			{
				"<leader>xf",
				function()
					require("neotest").output.open({ enter = true, quiet = false, auto_close = true })
				end,
				desc = "Open output window",
			},
			{
				"<leader>xc",
				function()
					require("neotest").output_panel.toggle()
				end,
				desc = "Toggle output panel",
			},
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-python"),
				},
			})
		end,
	},
}
