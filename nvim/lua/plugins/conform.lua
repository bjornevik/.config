return {
	{
		"stevearc/conform.nvim",
		lazy = false,
		opts = {
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
				stop_after_first = true,
			},
			formatters_by_ft = {
				astro = { "prettierd", "prettier" },
				css = { "prettierd", "prettier" },
				go = { "gofmt" },
				html = { "prettierd", "prettier" },
				javascript = { "prettierd", "prettier" },
				javascriptreact = { "prettierd", "prettier" },
				json = { "jq" },
				lua = { "stylua" },
				-- markdown = { "prettierd", "prettier" },
				ocaml = { "ocamlformat " },
				rust = { "rustfmt" },
				typescript = { "prettierd", "prettier" },
				typescriptreact = { "prettierd", "prettier" },
				vue = { "prettierd", "prettier" },
			},
		},
		keys = function()
			local cf = require "conform"
			return {
				{
					"<leader>nf",
					function()
						cf.format { async = true, lsp_format = "fallback", stop_after_first = true }
					end,
					desc = "conform: format",
				},
			}
		end,
	},
}
