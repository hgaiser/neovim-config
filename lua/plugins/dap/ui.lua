local dapui = require("dapui")
local dap = require("dap")

dapui.setup({})

-- Open and close the dap ui automatically.
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
-- dap.listeners.before.event_terminated["dapui_config"] = function()
-- 	dapui.close()
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
-- 	dapui.close()
-- end

vim.cmd([[
" Use JsonFormat command to format json files.
command! DapUiToggle :lua require("dapui").toggle()
]])

