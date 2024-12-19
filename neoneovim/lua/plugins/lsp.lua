local lua_ls_settings = {
	Lua = {
		hint = { enable = true },
	},
}

local js_ts_inlayhints = {
	inlayHints = {
		includeInlayParameterNameHints = "all",
		includeInlayParameterNameHintsWhenArgumentMatchesName = false,
		includeInlayFunctionParameterTypeHints = true,
		includeInlayVariableTypeHints = true,
		includeInlayVariableTypeHintsWhenTypeMatchesName = false,
		includeInlayPropertyDeclarationTypeHints = true,
		includeInlayFunctionLikeReturnTypeHints = true,
		includeInlayEnumMemberValueHints = true,
	},
}

return {
	{
		"neovim/nvim-lspconfig",
		enabled = true,
		dependencies = {
			{
				"saghen/blink.cmp",
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
		config = function()
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

					-- TODO: I never actually use these, do I need to add them?
					-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
					-- vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
					-- vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { buffer = 0 })
				end,
			})

			local lspconfig = require "lspconfig"
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			-- LUA
			lspconfig.lua_ls.setup {
				capabilities = capabilities,
				settings = lua_ls_settings,
			}

			-- ts/tsx/vue
			lspconfig.eslint.setup { capabilities = capabilities }
			-- lspconfig.volar.setup {}
			lspconfig.ts_ls.setup {
				capabilities = capabilities,
				settings = {
					typescript = js_ts_inlayhints,
					javascript = js_ts_inlayhints,
				},
				init_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
							languages = { "javascript", "typescript", "vue" },
						},
					},
				},
				filetypes = {
					"javascript",
					"javascriptreact",
					"javascript.jsx",
					"typescript",
					"typescriptreact",
					"typescript.tsx",
					"vue",
				},
			}

			-- css
			-- lspconfig.tailwindcss.setup {}
		end,
	},
}
