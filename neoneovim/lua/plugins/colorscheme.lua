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
		enabled = true,
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.gruvbox_baby_use_original_palette = true
			vim.cmd.colorscheme "gruvbox-baby"
		end
	}
}
