return {
	{
		"Wansmer/treesj",
		dependencies = { "nvim-treesitter" },
		opts = {
			use_default_keymaps = false,
		},
		keys = {
			{ "gS", "<cmd>TSJSplit<cr>", desc = "Split line" },
			{ "gJ", "<cmd>TSJJoin<cr>", desc = "Join line" },
		},
	},
}
