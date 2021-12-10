-- lspsaga for some LSP utilities.
require('lspsaga').init_lsp_saga {
	error_sign = '●',
	warn_sign = '●',
	hint_sign = '●',
	infor_sign = '●',
	code_action_icon = '●',
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

-- Show line diagnostics.
-- autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

-- Use `[g` and `]g` to navigate diagnostics.
utils.map { 'n', '[g', ':Lspsaga diagnostic_jump_prev<CR>' }
utils.map { 'n', ']g', ':Lspsaga diagnostic_jump_prev<CR>' }

-- Rename.
utils.map { 'n', '<Leader>rn', ':Lspsaga rename<CR>' }
