return {
	"olexsmir/gopher.nvim",
	enabled = true,
	ft = "go",
	build = function()
		vim.cmd.GoInstallDeps()
	end,
	---@module "gopher"
	---@type gopher.Config
	opts = {},
}
