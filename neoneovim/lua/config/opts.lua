vim.opt.clipboard = "unnamedplus"
vim.opt.errorbells = false
vim.opt.encoding = "utf-8"
vim.opt.cmdheight = 2
vim.opt.termguicolors = true

vim.opt.signcolumn = "yes"
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.breakindent = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.completeopt = { "menuone", "noinsert", "noselect" }

vim.opt.updatetime = 250

vim.opt.splitright = true

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "~", nbsp = "␣", space = "·" }

vim.opt.inccommand = "split"

vim.opt.cursorline = true
vim.opt.colorcolumn = "80"

vim.opt.swapfile = false -- Does snacks.bigfile fix this?
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath "config" .. "/undodir"
vim.opt.undofile = true

vim.opt.wrap = false

--============================== AUTOCOMMANDS ==============================--
vim.api.nvim_create_augroup("custom_opts", {})

-- I don't want to redo this vim.opt in every `ftplugin/*.xx`, so overriding here.
-- This needs to be defined in an autocmd because ftplugins set their own formatoptions
-- ftplugins/ sometimes overrides vim.opt.settings
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("custom_opts", {}),
	callback = function()
		-- :help fo-table
		-- c -> auto-wrap comments using 'textwidth'
		-- o -> auto insert current comment leader after hitting 'o' or 'O'
		vim.opt.formatoptions:remove { "c", "o" }

		vim.opt.scrolloff = 8
	end,
})

-- Show diagnostic on cursor hover.
vim.api.nvim_create_autocmd("CursorHold", {
	group = "custom_opts",
	pattern = "*",
	callback = function()
		vim.diagnostic.open_float { scope = "cursor", focusable = false, border = "rounded" }
	end,
	desc = "Show diagnostic on cursor hover.",
})
