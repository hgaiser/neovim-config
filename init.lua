-- Common settings.
require('utils')
require('settings')
require('theme')
require('maps')

-- Load plugins and their settings.
require('plugins')
require('plugins.impatient')
require('plugins.lualine')
require('plugins.gitsigns')
require('plugins.nvim-tree')
require('plugins.telescope')
require('plugins.treesitter')

-- Language Server Protocol.
require('lsp')
