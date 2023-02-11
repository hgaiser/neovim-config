return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = function()
			return {
				options = {
					theme = "auto",
					icons_enabled = false,
					component_separators = "|",
					section_separators = "",
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "filename" },
					lualine_c = { "lsp_progress" },
					lualine_x = { "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
			}
		end,
	},

	{ "arkav/lualine-lsp-progress" },
}
