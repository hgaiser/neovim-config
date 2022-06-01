local cmp = require('cmp')
local types = require('cmp.types')

cmp.setup({
	-- Enable LSP snippets
	snippet = {
		expand = function(args)
			vim.fn['vsnip#anonymous'](args.body)
		end,
	},
	mapping = {
		['<Down>'] = cmp.mapping.select_next_item(),
		['<Up>'] = cmp.mapping.select_prev_item(),
		['<Tab>'] = cmp.mapping.select_next_item(),
		['<S-Tab>'] = cmp.mapping.select_prev_item(),
		['<C-Space>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		})
	},

	-- Installed sources
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' },
		{ name = 'path' },
		{ name = 'buffer' },
	},
})
