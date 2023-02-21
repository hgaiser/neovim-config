return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				clangd = {},
				pyright = {},
				dockerls = {},
				yamlls = {},
				jsonls = { cmd = { 'vscode-json-languageserver', '--stdio' } },
				bashls = {},
				cmake = {},
				volar = {
					filetypes = {'vue'},
					init_options = {
						typescript = {
							serverPath = '/usr/lib/node_modules/typescript/lib/tsserverlibrary.js'
						}
					}
				},
				tsserver = {},
			},
			setup = {
				["*"] = function(server, opts) end,
			},
		},
		config = function(plugin, opts)
			local servers = opts.servers
			local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
			local function setup(server)
				local server_opts = vim.tbl_deep_extend("force", {
					capabilities = vim.deepcopy(capabilities),
				}, servers[server] or {})

				if opts.setup[server] then
					if opts.setup[server](server, server_opts) then
						return
					end
				elseif opts.setup["*"] then
					if opts.setup["*"](server, server_opts) then
						return
					end
				end
				require("lspconfig")[server].setup(server_opts)
			end

			for server, server_opts in pairs(servers) do
				if server_opts then
					server_opts = server_opts == true and {} or server_opts
					setup(server)
				end
			end
		end,
		keys = {
			{ "gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Definition" },
			{ "gr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
			{ "<leader>cr", vim.lsp.buf.rename, desc = "Rename"}
		},
	},
}
