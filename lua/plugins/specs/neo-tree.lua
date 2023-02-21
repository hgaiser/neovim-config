return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = "Neotree",
		keys = {
			{ "`", function() require("neo-tree.command").execute({ toggle = true, reveal = true }) end, desc = "Filebrowser", },
		},
		opts = {
			enable_git_status = true,
			enable_diagnostics = false,
			close_if_last_window = true,
			default_component_configs = {
				icon = {
					folder_closed = "▶",
					folder_open = "▼",
					folder_empty = "▼",
					default = " ",
				},
				container = {
					enable_character_fade = false
				},
				name = {
					use_git_status_colors = false,
				},
				git_status = {
					symbols = {
						-- Change type
						added     = "✚",
						modified  = "✱",
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
			},
		}
	},
}
