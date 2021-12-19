-- Install Packer if it is not installed already.
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
	vim.api.nvim_command('packadd packer.nvim')
end

-- Autocommand that reloads neovim whenever you save the plugins/init.lua file.
vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost */plugins/init.lua source <afile> | PackerSync
	augroup end
]])

-- Use a protected call so we don't error out on first use.
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
}

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Code completion.
	-- Collection of common configurations for the Nvim LSP client.
	use {
		'neovim/nvim-lspconfig',
		config = function()
			require('plugins.lsp.languages.cpp')
			require('plugins.lsp.languages.python')
			require('plugins.lsp.languages.rust')
		end,
	}
	use {
		'tami5/lspsaga.nvim',
		config = [[require('plugins.lsp.saga')]],
	}
	-- Completion framework.
	use {
		'hrsh7th/nvim-cmp',
		config = [[require('plugins.lsp.cmp')]],
	}
	-- LSP completion source for nvim-cmp.
	use 'hrsh7th/cmp-nvim-lsp'
	-- Snippet completion source for nvim-cmp.
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'
	use 'rafamadriz/friendly-snippets' -- Set of commonly used snippets.
	-- Other useful completion sources (filesystem and buffered words).
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-buffer'
	-- -- To enable more of the features of rust-analyzer, such as inlay hints and more!
	-- use {
	-- 	'simrat39/rust-tools.nvim',
	-- 	config = [[require('plugins.lsp.languages.rust')]],
	-- }

	-- TreeSitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = [[require('plugins.treesitter')]],
	}
	use 'nvim-treesitter/nvim-treesitter-textobjects'

	-- Fuzzy finding.
	use {
		'nvim-telescope/telescope.nvim',
		config = [[require('plugins.telescope')]],
		requires = { 'nvim-lua/plenary.nvim' },
	}

	-- Theme (gruvbox).
	use 'rktjmp/lush.nvim'
	use {
		'ellisonleao/gruvbox.nvim',
		config = function()
			vim.o.background = 'dark'
			vim.g.gruvbox_sign_column = 'bg0'
			vim.g.gruvbox_contrast_dark = 'hard'
			vim.cmd([[colorscheme gruvbox-custom]])
			vim.opt.termguicolors = true
		end,
	}

	-- Git signs and text objects.
	use {
		'lewis6991/gitsigns.nvim',
		config = [[require('plugins.gitsigns')]],
		requires = { 'nvim-lua/plenary.nvim' },
	}

	-- File tree viewer.
	use {
		'kyazdani42/nvim-tree.lua',
		config = [[require('plugins.nvim-tree')]],
	}

	-- Status line (lualine).
	use {
		'nvim-lualine/lualine.nvim',
		config = [[require('plugins.lualine')]],
	}

	-- Cache lua plugins to spead up load times.
	use {
		'lewis6991/impatient.nvim',
		config = [[require('plugins.impatient')]],
	}

	use 'junegunn/vim-easy-align'        -- Alignment around operator
	use 'tpope/vim-commentary'           -- Comment code.
	use 'tpope/vim-surround'             -- Extension for changing surroundings.
	use 'tpope/vim-repeat'               -- Allow repeating of commands like change surroundings.
	-- use 'tpope/vim-sleuth'               -- Automatically find the indentation given the file and neighbouring files.
	use 'tpope/vim-fugitive'             -- Git support inside vim.
	use 'cespare/vim-toml'               -- Formatting for (Cargo).toml files.
	use 'rust-lang/rust.vim'             -- Formatting for rust files.
	use 'godlygeek/tabular'              -- Tabularizes blocks of texts according to a pattern.
	use 'mg979/vim-visual-multi'         -- Edit multiple locations simultaneously.
	use 'editorconfig/editorconfig-vim'  -- Read .editorconfig files to adjust formatting.

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
