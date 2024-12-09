return {
	{
		"stevearc/oil.nvim",
		enabled = true,
		opts = {},
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		config = function()
			require("oil").setup({ columns = { "icon" }, view_options = { show_hidden = true } })
			vim.keymap.set("n", "<leader>fb", "<cmd>Oil<cr>", { desc = "Open parent directory" })
		end,
	},
}