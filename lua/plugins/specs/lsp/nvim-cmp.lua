return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-vsnip",
		},
		opts = function()
			local cmp = require("cmp")
			return {
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
					['<CR>'] = cmp.mapping.confirm({ select = false }),
				},

				-- Installed sources
				sources = {
					{ name = 'nvim_lsp' },
					{ name = 'vsnip' },
					{ name = 'path' },
					{ name = 'buffer' },
				},

				preselect = cmp.PreselectMode.None,
			}
		end,
	},
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-vsnip" },
}
