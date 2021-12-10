vim.g.nvim_tree_show_icons = {
	git = 1,
	folders = 1,
	files = 0,
	folder_arrows = 0,
}
vim.g.nvim_tree_icons = {
	git = {
		unstaged = '●',
		staged = '●',
		unmerged = '●',
		renamed = '➜',
		untracked = '',
		deleted = '●',
		ignored = '◌'
	},
	folder = {
		arrow_open = '▾',
		arrow_closed = '▸',
		default = '▸',
		open = '▾',
		empty = '▸',
		empty_open = '▾',
		symlink = '▸',
		symlink_open = '▾',
	}
}

require('nvim-tree').setup {
	filters = {
		dotfiles = true,
	},
}

utils.map {'n', '<Leader>n', ':NvimTreeToggle<CR>'  }
utils.map {'n', '`'        , ':NvimTreeToggle<CR>'  }
utils.map {'n', '<Leader>`', ':NvimTreeFindFile<CR>'}
