return {
	{
		"ellisonleao/gruvbox.nvim",
		opts = {
			contrast = "hard",
			transparent_mode = true,
			italic = false,
		},
		init = function()
			vim.cmd.colorscheme("gruvbox")
		end,
	},
}
