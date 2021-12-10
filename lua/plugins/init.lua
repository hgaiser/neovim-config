-- Install Paq if it is not installed already.
local install_path = vim.fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', install_path})
end

require('paq') {
	-- Let Paq manage itself.
	'savq/paq-nvim';

	-- Common LUA plugin requirement.
	'nvim-lua/plenary.nvim';

	-- Code completion.
	-- Collection of common configurations for the Nvim LSP client.
	'neovim/nvim-lspconfig';
	'tami5/lspsaga.nvim';
	-- Completion framework.
	'hrsh7th/nvim-cmp';
	-- LSP completion source for nvim-cmp.
	'hrsh7th/cmp-nvim-lsp';
	-- Snippet completion source for nvim-cmp.
	'hrsh7th/cmp-vsnip';
	'hrsh7th/vim-vsnip';
	-- Other useful completion sources (filesystem and buffered words).
	'hrsh7th/cmp-path';
	'hrsh7th/cmp-buffer';
	-- To enable more of the features of rust-analyzer, such as inlay hints and more!
	'simrat39/rust-tools.nvim';

	-- TreeSitter
	{'nvim-treesitter/nvim-treesitter', run=vim.fn['TSUpdate']};
	'nvim-treesitter/nvim-treesitter-textobjects';

	-- Fuzzy finding.
	'nvim-telescope/telescope.nvim';

	-- Theme (gruvbox).
	'rktjmp/lush.nvim';
	'ellisonleao/gruvbox.nvim';

	-- Git gutter.
	'lewis6991/gitsigns.nvim';

	-- File tree viewer.
	'kyazdani42/nvim-tree.lua';

	-- Status line (lualine).
	'nvim-lualine/lualine.nvim';

	'junegunn/vim-easy-align';        -- Alignment around operator
	'tpope/vim-commentary';           -- Comment code.
	'tpope/vim-surround';             -- Extension for changing surroundings.
	'tpope/vim-repeat';               -- Allow repeating of commands like change surroundings.
	'tpope/vim-sleuth';               -- Automatically find the indentation given the file and neighbouring files.
	'tpope/vim-fugitive';             -- Git support inside vim.
	'cespare/vim-toml';               -- Formatting for (Cargo).toml files.
	'rust-lang/rust.vim';             -- Formatting for rust files.
	'godlygeek/tabular';              -- Tabularizes blocks of texts according to a pattern.
	'mg979/vim-visual-multi';         -- Edit multiple locations simultaneously.
	'editorconfig/editorconfig-vim';  -- Read .editorconfig files to adjust formatting.
	'lewis6991/impatient.nvim';       -- Cache lua plugins to spead up load times.
}

-- Load plugin configuration.
require('plugins.impatient')
require('plugins.lualine')
require('plugins.gitsigns')
require('plugins.nvim_tree')
require('plugins.telescope')
require('plugins.treesitter')
