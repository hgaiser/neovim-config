utils.map { 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>' }
utils.map { 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>' }
utils.map { 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>' }
utils.map { 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>' }
utils.map { 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>' }

-- Show line diagnostics on hover.
-- vim.cmd([[
-- autocmd CursorHold * lua vim.diagnostic.open_float()
-- ]])
