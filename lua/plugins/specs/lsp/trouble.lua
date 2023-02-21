return {
	{
		"folke/trouble.nvim",
		opts = {
			icons = false,
			fold_open = "▼",
			fold_closed = "▶",
			indent_lines = false,
			signs = {
				error = "error",
				warning = "warn",
				hint = "hint",
				information = "info"
			},
			use_diagnostic_signs = false
		},
		keys = {
			{ "<leader>ct", "<cmd>TroubleToggle<cr>", desc = "Trouble"}
		},
	},
}
