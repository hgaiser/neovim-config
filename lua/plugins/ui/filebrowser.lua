return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = "Neotree",
		keys = {
			{
				"`",
				function()
					require("neo-tree.command").execute({ toggle = true, reveal = true })
				end,
				desc = "Filebrowser",
			},
		},
	},
}
