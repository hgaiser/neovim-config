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
			wk.register({
				mode = { "n", "v" },
				["g"] = { name = "Go" },

				["]"] = { name = "Next" },
				["]g"] = { name = "Git" },
				["["] = { name = "Prev" },
				["[g"] = { name = "Git" },

				["<leader>c"] = { name = "Code" },
				["<leader>f"] = { name = "Find" },

				["<leader>g"] = { name = "Git" },
				["<leader>gh"] = { name = "Hunk" },
				["<leader>gb"] = { name = "Buffer" },

				["<leader>d"] = { name = "Debugging" },
			})
		end,
	},
}
