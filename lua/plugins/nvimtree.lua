local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	api.config.mappings.default_on_attach(bufnr)

	vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
	vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
end

return {
	{
		"nvim-tree/nvim-tree.lua",
		lazy = true,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{
				"<C-o>",
				"<cmd>NvimTreeToggle<cr>",
				desc = "Toggle neotree",
			},
		},
		opts = {
			on_attach = my_on_attach,
			view = {
				width = 35,
			},
			renderer = {
				icons = {
					glyphs = {
						git = {
							untracked = "",
						},
					},
				},
			},
		},
	},
}
