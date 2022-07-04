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
