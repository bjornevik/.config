return {
	"folke/snacks.nvim",
	enabled = true,
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = false },
		notifier = { enabled = true },
		quickfile = { enabled = false },
		statuscolumn = { enabled = false },
		words = { enabled = false }
	},
	keys = {
		{ "<leader>lg", function() Snacks.lazygit() end,        desc = "(l)azy(g)it" },
		{ "<leader>.",  function() Snacks.scratch() end,        desc = "toggle scratch buffer" },
		{ "<leader>gb", function() Snacks.git.blame_line() end, desc = "(g)it (b)lame line" },
		{ "<leader>un", function() Snacks.notifier.hide() end,  desc = "dismiss all notifications" }
	}
}
