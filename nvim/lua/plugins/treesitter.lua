return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
		},
		config = function(a, b)
			---@diagnostic disable-next-line: missing-fields
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
				ignore_install = { "org" },
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
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
							["as"] = "@local.scope",
							["ap"] = "@parameter.outer",
							["ip"] = "@parameter.inner",
						},
					},
					move = {
						enable = true,
						set_jumps = true,
						goto_next_start = {
							["]m"] = "@function.outer",
							["]]"] = "@parameter.inner",
						},
						goto_previous_start = {
							["[m"] = "@function.outer",
							["[["] = "@parameter.inner",
						},
					},
				},
			}
		end,
	},
}
