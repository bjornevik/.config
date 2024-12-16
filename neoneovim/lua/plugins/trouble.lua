return {
	{
		"folke/trouble.nvim",
		opts = {
			modes = {
				diagnostics_buffer = {
					mode = "diagnostics",
					filter = { buf = 0 },
				},
				lsp_references = {
					mode = "lsp_references",
					follow = false,
					auto_jump = false,
				},
				lsp_document_symbols = {
					desc = "document symbols",
					mode = "lsp_document_symbols",
					focus = true,
					win = { position = "right" },
				},
			},
		},
		cmd = "Trouble",
		keys = function()
			local trouble = require "trouble"
			return {
				{
					"<C-q>",
					function()
						trouble.toggle "quickfix"
					end,
					noremap = true,
					silent = true,
					desc = "Quickfix (trouble)",
				},
				{
					"<leader>q",
					function()
						trouble.toggle "diagnostics"
					end,
					noremap = true,
					silent = true,
					desc = "Diagnostics (trouble)",
				},
				{
					"<C-j>",
					function()
						trouble.next { skip_groups = true, jump = true }
					end,
					noremap = true,
					desc = "Next (trouble)",
				},
				{
					"<C-k>",
					function()
						trouble.prev { skip_groups = true, jump = true }
					end,
					noremap = true,
					desc = "Previous (trouble)",
				},
			}
		end,
	},
}
