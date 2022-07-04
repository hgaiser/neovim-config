require("telescope").setup {
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown { }
		}
	}
}

-- Use telescope for vim.ui.select.
require("telescope").load_extension("ui-select")

utils.map { 'n', '<Leader>ff', '<cmd>Telescope find_files<cr>' }
utils.map { 'n', '<Leader>fg', '<cmd>Telescope live_grep<cr>'  }
utils.map { 'n', '<Leader>fb', '<cmd>Telescope buffers<cr>'    }
utils.map { 'n', '<Leader>fh', '<cmd>Telescope help_tags<cr>'  }

utils.map { 'n', '<S-Tab>', '<cmd>Telescope find_files<cr>' }
utils.map { 'n', '<Tab>', '<cmd>Telescope buffers<cr>'      }
