return {
	{
		"ggandor/leap.nvim",
		enabled = true,
		dependencies = {
			"tpope/vim-repeat",
		},
		keys = {
			{ "s", "<Plug>(leap-forward)", mode = {"n", "x"}, noremap = false, desc = "leap forward" },
			{ "S", "<Plug>(leap-backward)", noremap = false, desc = "leap backward" },
			{ "gs", "<Plug>(leap-backward)", mode = {"x"}, noremap = false, desc = "leap backward (visual mode)" },
		}
	},
	{
		-- improves f/F/t/T according to leap.nvim
		"ggandor/flit.nvim",
		enabled = true,
		dependencies = {
			"ggandor/leap.nvim",
			"tpope/vim-repeat"
		},
		opts = {}
	}
}
