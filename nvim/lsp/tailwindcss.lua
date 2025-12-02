---@type vim.lsp.Config
return {
	cmd = { "tailwindcss-language-server", "--stdio" },
	root_markers = {
		"tailwind.config.js",
		"tailwind.config.cjs",
		"tailwind.config.mjs",
		"tailwind.config.ts",
		"postcss.config.js",
		"postcss.config.cjs",
		"postcss.config.mjs",
		"postcss.config.ts",
		".git",
	},
	-- don't really use all of these, but they're the ones I think I _might_ need at some point
	filetypes = {
		-- html
		"astro",
		"astro-markdown",
		"gohtml",
		"gohtmltmpl",
		"html",
		"markdown",
		"mdx",
		-- css
		"css",
		"less",
		"postcss",
		"sass",
		"scss",
		"stylus",
		"sugarss",
		-- js
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		-- mixed
		"vue",
		"svelte",
	},
}
