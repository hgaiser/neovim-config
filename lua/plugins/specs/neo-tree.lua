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
		opts = {
			default_component_configs = {
				name = {
					use_git_status_colors = false,
				},
				git_status = {
					symbols = {
						-- Change type
						added     = "✚",
						modified  = "",
						deleted   = "✖",
						renamed   = "",
						-- Status type
						untracked = "?",
						ignored   = "",
						unstaged  = "",
						staged    = "",
						conflict  = "",
					}
				},
			}
		}
	},
}
