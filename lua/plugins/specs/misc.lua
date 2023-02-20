return {
	-- Interface dependencies.
	{ "MunifTanjim/nui.nvim", lazy = true },
	{ "nvim-lua/plenary.nvim", lazy = true },

	-- Extension for changing surroundings.
	{ "tpope/vim-surround" },
	-- Automatically find the indentation given the file and neighbouring files.
	{ "tpope/vim-sleuth" },
	-- Comment code.
	{ 'tpope/vim-commentary' },
	-- Read .editorconfig files to adjust formatting.
	{ "editorconfig/editorconfig-vim" },
	-- Edit multiple locations simultaneously.
	{ "mg979/vim-visual-multi" },
	-- Formatting for (Cargo).toml files.
	{ "cespare/vim-toml" },
	-- Formatting for rust files.
	{ "rust-lang/rust.vim" },
	-- LSP renaming.
	{ "smjonas/inc-rename.nvim" },
	-- Tabularizes blocks of texts according to a pattern.
	{ "godlygeek/tabular" },
}
