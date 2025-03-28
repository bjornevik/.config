--[[
    ____      ______  ____  _   _________    ________ __
   / __ )    / / __ \/ __ \/ | / / ____/ |  / /  _/ //_/
  / __  |_  / / / / / /_/ /  |/ / __/  | | / // // ,<
 / /_/ / /_/ / /_/ / _, _/ /|  / /___  | |/ // // /| |
/_____/\____/\____/_/ |_/_/ |_/_____/  |___/___/_/ |_|
--]]

-- Make sure to setup `mapLeader` and `maplocalleader` before
-- loading lazy.nvim so that the mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

require "config.opts"
require "config.maps"

require "config.lazy"

vim.keymap.set("n", "<space><space>x", "<cmd> source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "highlight when yanking text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.lsp.enable {
	"ts_ls",
	"tailwindcss",
	"volar",
	"eslint",
	"lua_ls",
	"gopls",
	-- "marksman",
	-- "ocamllsp",
}

-- Move this out whenever I make the jump fully
require("config.lsp.settings").setup_lsp_attach()
---@type vim.diagnostic.Opts
vim.diagnostic.config {
	virtual_text = false,
	virtual_lines = { current_line = true },
}
