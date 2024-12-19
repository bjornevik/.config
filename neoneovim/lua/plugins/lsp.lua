return {
	{
		"neovim/nvim-lspconfig",
		enabled = true,
		dependencies = {
			"saghen/blink.cmp",
			{
				"williamboman/mason-lspconfig.nvim",
				dependencies = {
					"williamboman/mason.nvim",
					opts = {},
				},
				opts = {
					ensure_installed = {
						"lua_ls",
						"ts_ls",
						"gopls",
						"ocamllsp",
						"eslint",
						"volar",
						"marksman",
						"tailwindcss",
					},
				},
			},
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				opts = {
					library = {
						-- See the configuration section for more details
						-- Load luvit types when the `vim.uv` word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		opts = {
			inlay_hints = {
				enabled = true,
				exclude = { "vue" },
			},
		},
		config = function()
			local lspconfig = require "lspconfig"
			local lspsettings = require "config.lsp.settings"

			lspconfig.lua_ls.setup(lspsettings.lua_ls)
			lspconfig.ts_ls.setup(lspsettings.ts_ls)
			lspconfig.gopls.setup(lspsettings.gopls)
			lspconfig.ocamllsp.setup(lspsettings.ocamllsp)
			lspconfig.eslint.setup(lspsettings.default)
			lspconfig.volar.setup(lspsettings.default)
			lspconfig.marksman.setup(lspsettings.default)
			lspconfig.tailwindcss.setup(lspsettings.default)

			lspsettings.setup_lsp_attach()
		end,
	},
}
