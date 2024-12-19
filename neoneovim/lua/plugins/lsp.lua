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

			-- Use autocmd instead of on attach
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("custom_on_attach", {}),
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if not client then
						return
					end

					if client.supports_method(client, "textDocument/hover") then
						vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
					end

					if client.supports_method(client, "textDocument/definition") then
						vim.keymap.set(
							"n",
							"gd",
							vim.lsp.buf.definition,
							{ buffer = 0, desc = "LSP: Go to definition" }
						)
					end

					if client.supports_method(client, "textDocument/inlayHint") then
						vim.keymap.set("n", "<leader>uh", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
						end, { noremap = true, desc = "LSP inlay hints", buffer = 0 })
					end

					if client.supports_method(client, "textDocument/rename") then
						vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = 0, desc = "LSP: rename" })
					end

					if client.supports_method(client, "textDocument/codeAction") then
						vim.keymap.set(
							"n",
							"<leader>a",
							vim.lsp.buf.code_action,
							{ buffer = 0, desc = "LSP: code action" }
						)
					end
				end,
			})
		end,
	},
}
