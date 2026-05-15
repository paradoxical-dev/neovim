return {
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		dependencies = {
			{ "niuiic/dap-utils.nvim", dependencies = { "niuiic/core.nvim" } },
		},
		config = function()
			local dap = require("dap")

			-- PYTHON --
			dap.adapters.debugpy = {
				type = "executable",
				command = vim.fn.trim(vim.fn.system("which python")),
				args = { "-m", "debugpy.adapter" },
				options = { source_filetype = "python" },
			}
			dap.configurations.python = {
				{
					type = "python",
					request = "launch",
					name = "Launch file",
					program = "${file}",
				},
			}

			-- BASH --
			dap.adapters.bash = {
				type = "executable",
				command = vim.fn.trim(vim.fn.system("which bash-debug-adapter")),
			}
			dap.configurations.sh = {
				{
					type = "bash",
					request = "launch",
					name = "Launch Bash",
					program = "${file}",
				},
			}

			-- C/C++ --
			dap.adapters.lldb = {
				type = "executable",
				command = vim.fn.trim(vim.fn.system("which lldb-dap")),
				name = "lldb",
			}
			dap.configurations.c = {
				{
					name = "Launch",
					type = "lldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
				},
			}
			dap.configurations.cpp = dap.configurations.c

			-- JAVASCRIPT (pwa-node via js-debug-adapter) --
			dap.adapters["pwa-node"] = {
				type = "server",
				host = "localhost",
				port = "${port}",
				executable = {
					command = vim.fn.trim(vim.fn.system("which js-debug-adapter")),
					args = { "${port}" },
				},
			}
			dap.configurations.javascript = {
				{
					name = "Launch with NPM",
					request = "launch",
					runtimeArgs = { "run-script", "debug" },
					runtimeExecutable = "npm",
					skipFiles = { "<node_internals>/**" },
					type = "pwa-node",
					cwd = "${workspaceFolder}",
				},
				{
					name = "Attach to process",
					type = "pwa-node",
					request = "attach",
					port = 9229,
					restart = true,
					timeout = 10000,
					skipFiles = { "<node_internals>/**" },
				},
			}

			-- CHROME --
			dap.adapters.chrome = {
				type = "executable",
				command = "node",
				args = { vim.fn.trim(vim.fn.system("which chrome-debug-adapter")) },
			}
			local chrome_path = vim.fn.trim(vim.fn.system("which google-chrome-stable"))
			local web_root = vim.fn.getcwd() .. "/src"
			dap.configurations.javascriptreact = {
				{
					name = "Launch Chrome",
					type = "chrome",
					request = "launch",
					url = "http://localhost:3000",
					webRoot = web_root,
					runtimeExecutable = chrome_path ~= "" and chrome_path or nil,
					runtimeArgs = {
						"--remote-debugging-port=9222",
						"--no-first-run",
						"--no-default-browser-check",
						"--disable-default-apps",
						"--disable-popup-blocking",
						"--user-data-dir=/tmp/vscode-chrome-debug-profile",
					},
					sourceMaps = true,
					protocol = "inspector",
				},
				{
					name = "Attach to Chrome",
					type = "chrome",
					request = "attach",
					port = 9222,
					webRoot = web_root,
					sourceMaps = true,
					protocol = "inspector",
				},
			}
		end,
		keys = {
			{
				"<leader>db",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Toggle Breakpoint",
			},
			{
				"<leader>dB",
				function()
					require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
				end,
				desc = "Set Breakpoint w/ Log",
			},
			{
				"<leader>dc",
				function()
					require("dap").continue()
				end,
				desc = "Continue",
			},
			{
				"<leader>di",
				function()
					require("dap").step_into()
				end,
				desc = "Step Into",
			},
			{
				"<leader>do",
				function()
					require("dap").step_over()
				end,
				desc = "Step Over",
			},
			{
				"<leader>du",
				function()
					require("dap").step_out()
				end,
				desc = "Step Out",
			},
			{
				"<leader>dr",
				function()
					require("dap").repl.open()
				end,
				desc = "Open REPL",
			},
			{
				"<leader>dl",
				function()
					require("dap").run_last()
				end,
				desc = "Run Last",
			},
			{
				"<leader>dU",
				function()
					require("dapui").toggle()
				end,
				desc = "Toggle UI",
			},
		},
	},

	{
		"rcarriga/nvim-dap-ui",
		lazy = true,
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		opts = {},
	},
}
