return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		config = function()
			local ts = require "nvim-treesitter"
			ts.setup()

			local ensure_installed = {
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
				"markdown",
			}

			pcall(ts.install, ensure_installed)

			local group = vim.api.nvim_create_augroup("UserTreesitterMain", {
				clear = true,
			})

			vim.api.nvim_create_autocmd("FileType", {
				group = group,
				callback = function(ev)
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(ev.buf))
					if ok and stats and stats.size > max_filesize then
						return
					end

					pcall(vim.treesitter.start, ev.buf)
					vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		init = function()
			vim.g.no_plugin_maps = true
		end,
		config = function()
			require("nvim-treesitter-textobjects").setup {
				select = { lookahead = true },
				move = { set_jumps = true },
			}
		end,
	},
}
