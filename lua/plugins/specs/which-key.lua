return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			plugins = {
				marks = false,
			},
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			wk.add({
				mode = { "n", "v" },
				{ "g", group = "Go" },

				{ "]", group = "Next" },
				{ "]g", group = "Git" },
				{ "[", group = "Prev" },
				{ "[g", group = "Git" },

				{ "<leader>c", group = "Code" },
				{ "<leader>f", group = "Find" },

				{ "<leader>g", group = "Git" },
				{ "<leader>gh", group = "Hunk" },
				{ "<leader>gb", group = "Buffer" },

				{ "<leader>d", group = "Debugging" },
			})
		end,
	},
}
