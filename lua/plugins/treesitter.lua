require('nvim-treesitter.configs').setup {
	ensure_installed = { 'rust', 'cpp', 'c', 'python' },
	highlight = { enable = true, },
	incremental_selection = { enable = true, },
}

require('nvim-treesitter.configs').setup {
	textobjects = {
		select = {
			enable = true,

			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,

			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['ab'] = '@block.outer',
				['ib'] = '@block.inner',
				['ac'] = '@class.outer',
				['ic'] = '@class.inner',
				['i,'] = '@parameter.inner',
				['a,'] = '@parameter.outer',
			},
		},
	},
}
