return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		keys = {
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffer" },
			{ "<Tab>", "<cmd>Telescope buffers<cr>", desc = "Find buffer" },

			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find file" },
			{ "<S-Tab>", "<cmd>Telescope find_files<cr>", desc = "Find file" },

			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Find in files" },
		},
	},
}
