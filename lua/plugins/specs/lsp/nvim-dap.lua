return {
	{
		"mfussenegger/nvim-dap",
		config = function(plugin, opts)
			-- TODO: Is this not the same as plugin?
			dap = require("dap")

			dap.adapters.lldb = {
				type = "executable",
				command = "/usr/bin/lldb-vscode",
				name = "lldb"
			}

			dap.configurations.cpp = {
			  {
				name = "Launch",
				type = "lldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},
			  },
			}

			dap.configurations.c = dap.configurations.cpp
			dap.configurations.rust = dap.configurations.cpp

			dap.adapters.python = {
				type = "executable";
				command = "/usr/bin/python";
				args = { "-m", "debugpy.adapter" };
			}
			dap.configurations.python = {
				{
					-- The first three options are required by nvim-dap
					type = "python",
					request = "launch",
					name = "Launch",

					-- Launch the current file.
					program = "${file}",
				},
			}

			-- Load launch.json files for additional configurations.
			require("dap.ext.vscode").load_launchjs()
		end,
		keys = function(plugin, opts)
			dap = require("dap")
			return {
				{ "<leader>dl", require("dap.ext.vscode").load_launchjs, desc = "Load launch.json" },
				{ "<leader>dL", function() vim.fn.mkdir(".vscode", "p"); vim.cmd("vsplit .vscode/launch.json") end, desc = "Edit launch.json" },
				{ "<leader>dc", dap.continue, desc = "Continue debugging" },
				{ "<leader>dso", dap.step_over, desc = "Over" },
				{ "<leader>dsi", dap.step_into, desc = "Into" },
				{ "<leader>dsO", dap.step_out, desc = "Out" },
				{ "<leader>db", dap.toggle_breakpoint, desc = "Toggle breakpoint" },
				-- { "<Leader>dB", dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")), silent = true },
				-- { "<Leader>dl", dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>, silent = true },
				-- { "<Leader>dr", dap.repl.open(), silent = true },
				-- { "<Leader>dl", dap.run_last(), silent = true },
			}
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		config = function(plugin, opts)
			require("dapui").setup({
				icons = {
					collapsed = "",
					current_frame = "",
					expanded = ""
				},
			})
			require("dap").listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
		end,
		keys = function(plugin, opts)
			dapui = require("dapui")
			return {
				{ "<leader>du", dapui.toggle, desc = "Toggle UI" },
			}
		end,
	},
}
