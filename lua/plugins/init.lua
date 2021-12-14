-- Install Packer if it is not installed already.
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Common LUA plugin requirement.
	use 'nvim-lua/plenary.nvim'

	-- Code completion.
	-- Collection of common configurations for the Nvim LSP client.
	use 'neovim/nvim-lspconfig'
	use 'tami5/lspsaga.nvim'
	-- Completion framework.
	use 'hrsh7th/nvim-cmp'
	-- LSP completion source for nvim-cmp.
	use 'hrsh7th/cmp-nvim-lsp'
	-- Snippet completion source for nvim-cmp.
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'
	use 'rafamadriz/friendly-snippets' -- Set of commonly used snippets.
	-- Other useful completion sources (filesystem and buffered words).
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-buffer'
	-- To enable more of the features of rust-analyzer, such as inlay hints and more!
	use 'simrat39/rust-tools.nvim'

	-- TreeSitter
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
	use 'nvim-treesitter/nvim-treesitter-textobjects'

	-- Fuzzy finding.
	use 'nvim-telescope/telescope.nvim'

	-- Theme (gruvbox).
	use 'rktjmp/lush.nvim'
	use 'ellisonleao/gruvbox.nvim'

	-- Git gutter.
	use 'lewis6991/gitsigns.nvim'

	-- File tree viewer.
	use 'kyazdani42/nvim-tree.lua'

	-- Status line (lualine).
	use 'nvim-lualine/lualine.nvim'

	use 'junegunn/vim-easy-align'        -- Alignment around operator
	use 'tpope/vim-commentary'           -- Comment code.
	use 'tpope/vim-surround'             -- Extension for changing surroundings.
	use 'tpope/vim-repeat'               -- Allow repeating of commands like change surroundings.
	use 'tpope/vim-sleuth'               -- Automatically find the indentation given the file and neighbouring files.
	use 'tpope/vim-fugitive'             -- Git support inside vim.
	use 'cespare/vim-toml'               -- Formatting for (Cargo).toml files.
	use 'rust-lang/rust.vim'             -- Formatting for rust files.
	use 'godlygeek/tabular'              -- Tabularizes blocks of texts according to a pattern.
	use 'mg979/vim-visual-multi'         -- Edit multiple locations simultaneously.
	use 'editorconfig/editorconfig-vim'  -- Read .editorconfig files to adjust formatting.
	use 'lewis6991/impatient.nvim'       -- Cache lua plugins to spead up load times.

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
