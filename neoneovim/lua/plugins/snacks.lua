return {
	"folke/snacks.nvim",
	enabled = true,
	dependencies = {
		{
			"folke/which-key.nvim",
			event = "VeryLazy",
			opts = {},
			keys = {
				{ "<leader>?", function() require("which-key").show { global = false } end, desc = "Buffer Local Keymaps (which-key)" }
			}
		}
	},
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		notify = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = false },
		dashboard = { enabled = true },
	},
	keys = {
		{ "<leader>lg", function() Snacks.lazygit() end,               desc = "(l)azy(g)it" },
		{ "<leader>.",  function() Snacks.scratch() end,               desc = "toggle scratch buffer" },
		{ "<leader>gb", function() Snacks.git.blame_line() end,        desc = "(g)it (b)lame line" },
		{ "<leader>un", function() Snacks.notifier.hide() end,         desc = "dismiss all notifications" },
		{ "<leader>nh", function() Snacks.notifier.show_history() end, desc = "show (n)otification (h)istory" }
	}
}
