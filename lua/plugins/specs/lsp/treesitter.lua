return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		keys = {
			{ "<c-space>", desc = "Increment selection" },
			{ "<bs>", desc = "Schrink selection", mode = "x" },
		},
		opts = {
			highlight = { enable = true },
			ensure_installed = {
				"bash",
				"help",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"tsx",
				"typescript",
				"vim",
				"yaml",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = "<nop>",
					node_decremental = "<bs>",
				},
			},

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
		},
		---@param opts TSConfig
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},

	{ "nvim-treesitter/nvim-treesitter-textobjects" },
}
