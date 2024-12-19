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

-- lspconfig.marksman.setup { on_attach = on_attach, capabilities = capabilities }
-- lspconfig.vimls.setup { on_attach = on_attach, capabilities = capabilities }
-- lspconfig.buf_ls.setup { on_attach = on_attach, capabilities = capabilities } -- proto
-- lspconfig.volar.setup { on_attach = on_attach, capabilities = capabilities }
-- lspconfig.astro.setup { on_attach = on_attach, capabilities = capabilities }
-- lspconfig.tailwindcss.setup { on_attach = on_attach, capabilities = capabilities }
-- lspconfig.ocamllsp.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   settings = {
--     codelens = { enable = true },
--     inlayHints = { enable = true },
--   },
-- }
return M
