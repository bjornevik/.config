return {
	{
		"akinsho/bufferline.nvim",
		enabled = true,
		version = "*",
		lazy = false,
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			options = {
				diagnostics = "nvim_lsp",
			},
		},
		keys = {
			{
				"<leader>gb",
				":BufferLinePick<CR>",
				mode = { "n" },
				noremap = true,
				silent = true,
				desc = "bufferline: (g)o to (b)uffer",
			},
			{
				"<M-h>",
				":BufferLineMovePrev<CR>",
				mode = { "n" },
				noremap = true,
				silent = true,
				desc = "bufferline: move buffer to the left",
			},
			{
				"<M-l>",
				":BufferLineMoveNext<CR>",
				mode = { "n" },
				noremap = true,
				silent = true,
				desc = "bufferline: move buffer to the right",
			},
		},
	},
}
