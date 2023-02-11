return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			signs = {
				add = { text = "▌" },
				change = { text = "▌" },
				delete = { text = "契" },
				topdelete = { text = "契" },
				changedelete = { text = "▌" },
				untracked = { text = "▌" },
			},
			on_attach = function(buffer)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
				end

				map("n", "]gh", gs.next_hunk, "Hunk")
				map("n", "[gh", gs.prev_hunk, "Hunk")
				map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<cr>", "Stage")
				map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<cr>", "Reset")
				map("n", "<leader>gbs", gs.stage_buffer, "Stage")
				map("n", "<leader>gbr", gs.reset_buffer, "Reset")
				-- map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
				-- map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
				-- map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
				-- map("n", "<leader>ghd", gs.diffthis, "Diff This")
				-- map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
				-- map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
			end,
		},
	},
}
