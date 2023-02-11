return {
	{
		"ellisonleao/gruvbox.nvim",
		opts = {
			contrast = "hard",
			overrides = {
				SignColumn = { bg = "NONE" },
				GitSignsAdd = { bg = "NONE" },
				GitSignsChange = { bg = "NONE" },
				GitSignsDelete = { bg = "NONE" },
			}
		},
		init = function()
			vim.cmd.colorscheme("gruvbox")
		end,
	},
}
