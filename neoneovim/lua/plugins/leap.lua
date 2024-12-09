return {
	{
		"ggandor/leap.nvim",
		enabled = true,
		dependencies = {
			"tpope/vim-repeat",
			{
				"ggandor/flit.nvim",
				opts = {}
			}
		},
		keys = {
			{ "s", "<Plug>(leap-forward)", mode = {"n", "x"}, noremap = false, desc = "leap forward" },
			{ "gs", "<Plug>(leap-backward)", mode = {"n", "x"}, noremap = false, desc = "leap backward" },
		}
	},
}
