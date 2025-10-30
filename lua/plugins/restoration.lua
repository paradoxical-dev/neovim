return {
	{
		"paradoxical-dev/restoration.nvim",
		-- lazy = true,
		event = "BufReadPre",
		keys = {
			{
				"<leader>pf",
				function()
					require("restoration").select()
				end,
				desc = "Search Projects",
			},
			{
				"<leader>pp",
				function()
					require("restoration").select({ cwd = true })
				end,
				desc = "Search Projects (CWD)",
			},
			{
				"<leader>pl",
				function()
					require("restoration").load({ latest = true })
				end,
				desc = "Restore Last Session",
			},
			{
				"<leader>pr",
				function()
					require("restoration").rename()
				end,
				desc = "Rename Session",
			},
			{
				"<leader>pd",
				function()
					require("restoration").delete()
				end,
				desc = "Delete Session",
			},
			{
				"<leader>pD",
				function()
					require("restoration").delete_project()
				end,
				desc = "Delete Project",
			},
			{
				"<leader>ps",
				function()
					require("restoration").save()
				end,
				desc = "Save Session",
			},
		},
		opts = {
			preserve = {
				breakpoints = true,
				qflist = true,
				undo = true,
				watches = true,
			},
			picker = {
				default = "snacks",
			},
		},
	},
}
