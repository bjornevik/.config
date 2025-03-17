return {
	{
		"echasnovski/mini.statusline",
		enabled = true,
		opts = {
			use_icons = true,
		},
	},
	{
		"echasnovski/mini.surround",
		enabled = false,
		opts = {
			mappings = {
				-- use "S", because s is used for leap.nvim
				add = "Sa",
				delete = "Sd",
				replace = "Sr",
				-- disable unused
				highlight = "",
				find = "",
				find_left = "",
				update_n_lines = "",
				suffix_last = "",
				suffix_next = "",
			},
		},
	},
}
