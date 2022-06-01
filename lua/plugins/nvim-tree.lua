require('nvim-tree').setup {
	filters = {
		dotfiles = true,
	},
	git = {
		ignore = false,
	},
	renderer = {
		indent_markers = {
			enable = true,
		},
		icons = {
			show = {
				git = true,
				folder = true,
				file = false,
				folder_arrow = false,
			},
			glyphs = {
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
				},
			},
		},
	},
}

utils.map {'n', '<Leader>n', ':NvimTreeToggle<CR>'  , silent = true}
utils.map {'n', '`'        , ':NvimTreeToggle<CR>'  , silent = true}
utils.map {'n', '<Leader>`', ':NvimTreeFindFile<CR>', silent = true}

-- Autoclose if nvim-tree is the last window open.
vim.cmd([[
autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])
