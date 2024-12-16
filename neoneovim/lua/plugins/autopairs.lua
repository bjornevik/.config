return {
	{
		"windwp/nvim-autopairs",
		enabled = true,
		dependencies = {
			{
				"windwp/nvim-ts-autotag",
				opts = {},
			},
		},
		opts = {
			ignored_next_char = "",
			enable_check_bracket_line = true,
			map_complete = true,
			map_cr = true,
			auto_select = true,
		},
	},
}
