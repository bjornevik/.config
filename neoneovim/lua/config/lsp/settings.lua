local M = {}

local capabilities = require("blink.cmp").get_lsp_capabilities()

--- Default settings for any language server that doesn't require extra setup
M.default = {
	capabilities = capabilities,
}

M.lua_ls = {
	capabilities = capabilities,
	settings = {
		Lua = {
			hint = { enable = true },
		},
	},
}

local js_inlay_hints = {
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

M.ts_ls = {
	capabilities = capabilities,
	settings = {
		typescript = js_inlay_hints,
		javascript = js_inlay_hints,
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

M.gopls = {
	capabilities = capabilities,
	settings = {
		gopls = {
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParamters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
		},
	},
}

M.ocamllsp = {
	capabilities = capabilities,
	settings = {
		codelens = { enable = true },
		inlayHints = { enable = true },
	},
}

---setup function to run the autocmd for 'LspAttach'
-- sets up the common keybinds
-- K -> hover
-- gd -> go to definition
-- <leader>uh -> toggle inlay hint
-- <leader>rn -> rename
-- <leader>a -> code action
M.setup_lsp_attach = function()
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("custom_on_attach", {}),
		callback = function(args)
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			if not client then
				return
			end

			---@diagnostic disable: missing-fields

			if client.supports_method(client, "textDocument/hover") then
				vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
			end

			if client.supports_method(client, "textDocument/definition") then
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0, desc = "LSP: Go to definition" })
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
				vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { buffer = 0, desc = "LSP: code action" })
			end
		end,
	})
end

return M
