return {
	{
		"kevinhwang91/nvim-ufo",
		enabled = true,
		dependencies = {
			"kevinhwang91/promise-async"
		},
		opts = {
			provider_selector = function(bufnr, filetype, buftype)
				return { "treesitter", "indent" }
			end
		},
		init = function()
			vim.o.foldcolumn = '1'
			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true
		end,
		keys = function()
			local ufo = require("ufo")
			return {
				{ "n", "zR", ufo.openAllFolds,  desc = "open all folds" },
				{ "n", "zM", ufo.closeAllFolds, desc = "close all folds" },
			}
		end
	}
}
