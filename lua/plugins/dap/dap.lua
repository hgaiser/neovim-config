local dap = require('dap')
dap.adapters.lldb = {
	type = 'executable',
	command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
	name = 'lldb'
}

dap.configurations.cpp = {
	{
		name = 'Launch',
		type = 'lldb',
		request = 'launch',
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end,
		cwd = '${workspaceFolder}',
		stopOnEntry = false,
		args = {},
	},
}
dap.configurations.c = dap.configurations.cpp

dap.adapters.python = {
	type = 'executable';
	command = '/usr/bin/python';
	args = { '-m', 'debugpy.adapter' };
}
dap.configurations.python = {
	{
		-- The first three options are required by nvim-dap
		type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
		request = 'launch';
		name = "Launch file";

		-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

		program = "${file}"; -- This configuration will launch the current file if used.
		pythonPath = function()
			-- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
			-- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
			-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
			local cwd = vim.fn.getcwd()
			if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
				return cwd .. '/venv/bin/python'
			elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
				return cwd .. '/.venv/bin/python'
			else
				return '/usr/bin/python'
			end
		end;
	},
}

vim.fn.sign_define('DapBreakpoint', {text='⏹', texthl='GruvboxRed', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointCondition', {text='⏹', texthl='GruvboxOrange', linehl='', numhl=''})
vim.fn.sign_define('DapLogPoint', {text='⏹', texthl='GruvboxBlue', linehl='', numhl=''})

utils.map { 'n', '<F5>', ':lua require("dap").continue()<CR>', silent = true }
utils.map { 'n', '<F10>', ':lua require("dap").step_over()<CR>', silent = true }
utils.map { 'n', '<F11>', ':lua require("dap").step_into()<CR>', silent = true }
utils.map { 'n', '<F12>', ':lua require("dap").step_out()<CR>', silent = true }
utils.map { 'n', '<Leader>b', ':lua require("dap").toggle_breakpoint()<CR>', silent = true }
utils.map { 'n', '<Leader>B', ':lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', silent = true }
utils.map { 'n', '<Leader>lp', ':lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', silent = true }
utils.map { 'n', '<Leader>dr', ':lua require("dap").repl.open()<CR>', silent = true }
utils.map { 'n', '<Leader>dl', ':lua require("dap").run_last()<CR>', silent = true }
