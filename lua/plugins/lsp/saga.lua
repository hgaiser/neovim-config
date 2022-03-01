-- lspsaga for some LSP utilities.
require('lspsaga').init_lsp_saga {
	error_sign = '●',
	warn_sign = '●',
	hint_sign = '●',
	infor_sign = '●',
	code_action_icon = '●',
	diagnostic_header_icon = '',
	code_action_icon = '',
	finder_definition_icon = '',
	finder_reference_icon = '',
	definition_preview_icon = '',
	code_action_prompt = {
		enable = true,
		sign = false,
		virtual_text = true,
	},
	rename_prompt_prefix = '>',
	rename_action_keys = {
		quit = '<Esc>', exec = '<CR>'
	},
	code_action_keys = {
		quit = '<Esc>', exec = '<CR>'
	},
}

-- Apply code actions.
utils.map { 'n', '<C-s><C-s>', ':Lspsaga code_action<CR>' }
utils.map { 'v', '<C-s><C-s>', ':<C-U>Lspsaga range_code_action<CR>' }

-- Show documentation.
utils.map { 'n', '?', ':Lspsaga hover_doc<CR>' }

-- Rename.
utils.map { 'n', '<Leader>rn', ':Lspsaga rename<CR>' }

-- Remove retarded purple color on diagnostic floating windows.
vim.cmd([[
hi link LspSagaDiagnosticBorder GruvboxFg0
hi link LspSagaDiagnosticHeader GruvboxFg0
hi link LspSagaDiagnosticTruncateLine GruvboxFg0
]])
