return {
	{
		"akinsho/bufferline.nvim",
		enabled = true,
		version = "*",
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
		},
	},
}
