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
						---@diagnostic disable-next-line: missing-parameter, missing-fields
						trouble.next { skip_groups = true, jump = true }
					end,
					noremap = true,
					desc = "Next (trouble)",
				},
				{
					"<C-k>",
					function()
						---@diagnostic disable-next-line: missing-parameter, missing-fields
						trouble.prev { skip_groups = true, jump = true }
					end,
					noremap = true,
					desc = "Previous (trouble)",
				},
			}
		end,
		init = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("trouble_on_attach", {}),
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if not client then
						return
					end
					local trouble = require "trouble"

					if client.supports_method(client, "textDocument/references") then
						vim.keymap.set("n", "gr", function()
							trouble.toggle "lsp_references"
						end, { buffer = 0, desc = "LSP References" })
					end

					-- if client.supports_method(client, "textDocument/documentSymbol") then
					-- 	vim.keymap.set("n", "<leader>ds", function()
					-- 		require("trouble").toggle "lsp_document_symbols"
					-- 	end, { buffer = 0 })
					-- end
				end,
			})
		end,
	},
}
