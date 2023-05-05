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

			-- Don't know why, but floating windows have no background.
			-- This links the style to that of Pmenu, which looks okay.
			vim.api.nvim_set_hl(0, "NormalFloat", { link = "Pmenu" })
		end,
	},
}
