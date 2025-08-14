---@type vim.lsp.Config
return {
	cmd = { "ocamllsp" },
	filetypes = {
		"ocaml",
		"ocaml.menhir",
		"ocaml.interface",
		"ocaml.ocamllex",
		"dune",
	},
	settings = {
		extendedHover = { enable = true },
		codelens = { enable = true },
		duneDiagnostics = { enable = true },
		-- inlayHints = { enable = true },
		inlayHints = {
			hintPatternVariables = true,
			hintLetBindings = true,
			hintFunctionParams = true,
		},
		syntaxDocumentation = { enable = true },
		merlinJumpCodeActions = { enable = true },
	},
}
