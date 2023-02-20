return {
	-- Snippet completion source for nvim-cmp.
	{ "hrsh7th/cmp-vsnip" },
	{
		"hrsh7th/vim-vsnip",
		init = function(args)
			vim.g.vsnip_snippet_dir = vim.fn.stdpath("config") .. "/vsnip"
		end,
	},
}
