return {
	{
		"folke/tokyonight.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme "tokyonight"
		end,
	},
	{
		"luisiacc/gruvbox-baby",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.gruvbox_baby_use_original_palette = true
			vim.cmd.colorscheme "gruvbox-baby"
		end,
	},
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_disabled_italic_comment = false
			vim.g.gruvbox_material_foreground = "original"
			vim.g.gruvbox_material_background = "soft"
			vim.o.background = "light"
			vim.cmd.colorscheme "gruvbox-material"
		end,
	},
}
