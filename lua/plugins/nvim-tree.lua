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

-- Close nvim if nvim-tree is the last buffer.
vim.api.nvim_create_autocmd("BufEnter", {
	nested = true,
	callback = function()
		if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
			vim.cmd "quit"
		end
	end
})
