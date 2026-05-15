return {
	-- LSP --

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"paradoxical-dev/lsp_hover",
			"folke/neoconf.nvim",
		},
		config = function()
			-- default on attach function
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local client = vim.lsp.get_client_by_id(ev.data.client_id)
					local bufnr = ev.buf
					local options = { buffer = bufnr, remap = false }

					-- keymaps for lsp actions
					vim.keymap.set("n", "gd", function()
						vim.lsp.buf.definition()
					end, { buffer = bufnr, remap = false, desc = "Go to Definition" })

					vim.keymap.set("n", "<leader>lf", function()
						vim.diagnostic.open_float()
					end, { buffer = bufnr, remap = false, desc = "Diagnostic Float" })

					vim.keymap.set("n", "[d", function()
						vim.diagnostic.goto_next()
					end, { buffer = bufnr, remap = false, desc = "Next Diagnostic" })

					vim.keymap.set("n", "]d", function()
						vim.diagnostic.goto_prev()
					end, { buffer = bufnr, remap = false, desc = "Previous Diagnostic" })

					vim.keymap.set("n", "<leader>lc", function()
						require("tiny-code-action").code_action()
					end, { buffer = bufnr, remap = false, desc = "Code Actions" })

					vim.keymap.set("n", "<leader>lR", function()
						vim.lsp.buf.rename()
					end, { buffer = bufnr, remap = false, desc = "Symbol Rename" })

					vim.keymap.set("i", "<C-h>", function()
						vim.lsp.buf.signature_help()
					end, options)

					vim.diagnostic.config({
						virtual_text = false, -- no vtext (because of tiny_inline)
						signs = {
							text = {
								[vim.diagnostic.severity.ERROR] = "",
								[vim.diagnostic.severity.WARN] = "",
								[vim.diagnostic.severity.INFO] = "",
								[vim.diagnostic.severity.HINT] = "",
							},
						},
					})

					-- prettier hover info
					require("lsp_hover").setup()

					-- setup navic
					if client and client.server_capabilities.documentSymbolProvider then
						require("nvim-navic").attach(client, bufnr)
					end
				end,
			})

			local servers = {
				bashls = "bash-language-server",
				clangd = "clangd",
				cmake = "cmake-language-server",
				cssls = "vscode-css-language-server",
				denols = "deno",
				dockerls = "docker-langserver",
				html = "vscode-html-language-server",
				lua_ls = "lua-language-server",
				nixd = "nixd",
				pyright = "pyright",
				rust_analyzer = "rust-analyzer",
				ts_ls = "typescript-language-server",
				yamlls = "yaml-language-server",
			}

			local function server_exists(name)
				return vim.fn.executable(name) == 1
			end

			for server, binary in pairs(servers) do
				if server_exists(binary) then
					vim.lsp.enable(server)
				end
			end
		end,
	},

	-- EXTRAS --

	{ -- lsp hover styling
		"paradoxical-dev/lsp_hover",
		lazy = true,
		opts = {
			default = {
				name = "󰗊 LSP/Hover",
				border_hl = "MarkviewGradient6",
				min_width = 30,
			},
			["^lua_ls"] = {
				name = " lua_ls",
				border_hl = "MarkviewGradient6",
			},
			["^nil_ls"] = {
				name = "󱄅 nil_ls",
				border_hl = "MarkviewGradient6",
			},
			["^nixd"] = {
				name = "󱄅 nixd",
				border_hl = "MarkviewGradient6",
			},
			["^pyright"] = {
				name = "󰌠 pyright",
				border_hl = "MarkviewGradient6",
			},
			["^denols"] = {
				name = " denols",
				border_hl = "MarkviewGradient6",
			},
			["^clangd"] = {
				name = " clangd",
				border_hl = "MarkviewGradient6",
			},
			["^cssls"] = {
				name = " cssls",
				border_hl = "MarkviewGradient6",
			},
			["^rust_analyzer"] = {
				name = " rust_analyzer",
				border_hl = "MarkviewGradient6",
			},
			["^bashls"] = {
				name = " bashls",
				border_hl = "MarkviewGradient6",
			},
		},
	},

	{ -- symbol nav
		{
			"bassamsdata/namu.nvim",
			event = "LSPAttach",
			keys = {
				{
					"<leader>ls",
					"<cmd>Namu symbols<CR>",
					desc = "Document Symbols",
					{ silent = true },
				},
			},
			opts = {
				namu_symbols = {
					enabled = true,
					options = {},
				},
				colorscheme = { enabled = false },
				ui_select = { enabled = false },
			},
		},
	},

	{ -- goto previews
		{
			"rmagatti/goto-preview",
			event = { "BufReadPre", "LspAttach" },
			keys = {
				{
					"<leader>lg",
					function()
						require("goto-preview").goto_preview_definition()
					end,
					desc = "Goto Preview Definition",
				},
			},
			config = function()
				require("goto-preview").setup({})
			end,
		},
	},

	{ -- better diagnostics
		{
			"rachartier/tiny-inline-diagnostic.nvim",
			event = "LspAttach",
			priority = 1000,
			opts = {
				hi = {
					background = "Normal",
				},
				options = {
					multilines = { enabled = true },
				},
			},
		},
	},

	{ -- code actions styling
		{
			"rachartier/tiny-code-action.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
			event = "LspAttach",
			opts = {
				backend = "vim",
				picker = {
					"buffer",
					opts = {
						hotkeys = true,
						winborder = "rounded",
					},
				},
			},
		},
	},

	{ -- winbar symbols
		{
			"SmiteshP/nvim-navic",
			event = "LspAttach",
			-- lazy = true,
			opts = {
				lsp = { auto_attach = true },
			},
		},
	},

	-- FORMATTING --

	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				json = { "jq" },
				nix = { "nixfmt" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				rust = { "rustfmt", lsp_format = "fallback" },
				c = { "clang-format" },
				cpp = { "clang-format" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		},
	},
}
