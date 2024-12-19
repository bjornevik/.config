return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup {
				ensure_installed = {
					"lua",
					"go",
					"typescript",
					"tsx",
					"javascript",
					"vue",
					"svelte",
					"html",
					"css",
					"json",
					"json5",
					"toml",
					"terraform",
					"dockerfile",
					"proto",
					"ocaml",
					"rust",
					"vimdoc",
					"gosum",
					"gomod",
				},
				auto_install = false,
				highlight = {
					enable = true,
					disable = function(lang, buf)
						local max_filesize = 100 * 1024 -- 100 KB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end,
					additional_vim_regex_highlighting = false,
				},
			}
		end,
	},
}
