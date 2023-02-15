return {
	"simrat39/rust-tools.nvim",
	opts = {
		tools = { -- rust-tools options
			autoSetHints = true,
			inlay_hints = {
				show_parameter_hints = true,
				parameter_hints_prefix = "",
				other_hints_prefix = "",
			},
		},

		-- all the opts to send to nvim-lspconfig
		-- these override the defaults set by rust-tools.nvim
		-- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
		server = {
			-- on_attach is a callback called when the language server attachs to the buffer
			-- on_attach = on_attach,
			settings = {
				-- to enable rust-analyzer settings visit:
				-- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
				["rust-analyzer"] = {
					-- enable clippy on save
					checkOnSave = {
						command = "clippy"
					},
				}
			},

			-- Disable support for standalone .rs files to improve startup time.
			standalone = false,

			-- Use a faster root_dir function to improve startup time.
			root_dir = require("lspconfig").util.find_git_ancestor,
		},
		dependencies = {
			"neovim/nvim-lspconfig",
		}
	}
}
