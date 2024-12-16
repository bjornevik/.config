return {
	{
		"hrsh7th/nvim-cmp",
		enabled = true,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
			"onsails/lspkind-nvim",
			-- { "rafamadriz/friendly-snippets" },
			-- { "L3MON4D3/LuaSnip" },
			-- { "saadparwaiz1/cmp_luasnip" },
		},
		opts = function()
			local cmp = require "cmp"
			return {
				mapping = {
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-y>"] = cmp.mapping.confirm { select = true },
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.close(),
				},
				sources = {
					{ name = "nvim_lua" },
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "path" },
				},
				formatting = {
					format = function(entry, vim_item)
						-- fancy icons and a name of kind
						vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

						-- set a name for each source
						vim_item.menu = ({
							nvim_lsp = "[LSP]",
							buffer = "[Buffer]",
							luasnip = "[LuaSnip]",
							path = "[Path]",
							nvim_lua = "[Lua]",
						})[entry.source.name]
						return vim_item
					end,
				},
				cmdline = {
					mapping = cmp.mapping.preset.cmdline(),
					sources = { { name = "buffer" } },
				},
			}
		end,
		-- init = function()
		-- 	local cmp_autopairs = require "nvim-autopairs.completion.cmp"
		-- 	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
		-- end
	},
}
