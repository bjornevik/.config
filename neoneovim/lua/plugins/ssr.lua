return {
	{
		-- (S)tructural (S)earch and (R)eplace
		"cshuaimin/ssr.nvim",
		enabled = true,
		modules = "ssr",
		opts = {}, -- use default opts, not really necessary as setup is optional
		keys = {
			{ "<leader>sr", function() require("ssr").open() end, mode = { "n", "x" }, desc = "structural search and replace" }
		}
	}
}
