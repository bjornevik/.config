---@type vim.lsp.Config
return {
	cmd = { "vue-language-server", "--stdio" },
	filetypes = { "vue" },
	root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git", "nuxt.config.ts" },
	init_options = {
		typescript = {
			-- fall back to global install if not installed in project
			tsdk = "/usr/local/lib/node_modules/typescript/lib",
		},
	},
	on_new_config = function(new_config, new_root_dir)
		-- if installed in project, use that version of ts
		local lib_path = vim.fs.find("node_modules/typescript/lib", { path = new_root_dir, upward = true })[1]
		if lib_path then
			new_config.init_options.typescript.tsdk = lib_path
		end
	end,
}
