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
		untracked = '◌',
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
	git = {
		ignore = false,
	},
	nvim_tree_indent_markers = 1,
}

utils.map {'n', '<Leader>n', ':NvimTreeToggle<CR>'  , silent = true}
utils.map {'n', '`'        , ':NvimTreeToggle<CR>'  , silent = true}
utils.map {'n', '<Leader>`', ':NvimTreeFindFile<CR>', silent = true}

-- Autoclose if nvim-tree is the last window open.
vim.cmd([[
autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])
