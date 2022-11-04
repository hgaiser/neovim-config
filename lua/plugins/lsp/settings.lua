utils.map { 'n', 'gD', '<cmd>lua require(\'telescope.builtin\').lsp_implementations()<CR>' }
utils.map { 'n', 'gd', '<cmd>lua require(\'telescope.builtin\').lsp_definitions()<CR>' }
utils.map { 'n', 'gr', '<cmd>lua require(\'telescope.builtin\').lsp_references()<CR>' }
utils.map { 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>' }
utils.map { 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>' }
utils.map { 'n', 'g?', '<cmd>lua vim.diagnostic.open_float()<CR>' }

-- Show line diagnostics on hover.
-- vim.cmd([[
-- autocmd CursorHold * lua vim.diagnostic.open_float()
-- ]])
