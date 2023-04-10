return {
	{
		"ellisonleao/gruvbox.nvim",
		opts = {
			contrast = "hard",
			transparent_mode = true,
			italic = {
				strings = false,
				operators = false,
				comments = false,
			},
		},
		init = function()
			vim.cmd.colorscheme("gruvbox")
		end,
	},
}
