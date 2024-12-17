-- sync OS and Neovim clipboards
vim.opt.clipboard = "unnamedplus"

-- This needs to be defined in an autocmd because ftplugins set their own formatoptions
-- I don't want to redo this vim.opt in every `ftplugin/*.xx`, so overriding here.
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("custom_formatoptions", {}),
	callback = function()
		-- :help fo-table
		-- c -> auto-wrap comments using 'textwidth'
		-- o -> auto insert current comment leader after hitting 'o' or 'O'
		vim.opt.formatoptions:remove { "c", "o" }
	end,
})

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

vim.opt.updatetime = 250

vim.opt.splitright = true

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "~", nbsp = "␣", space = "·" }

vim.opt.inccommand = "split"

vim.opt.cursorline = true

vim.opt.scrolloff = 10

vim.opt.swapfile = false -- Does snacks.bigfile fix this?
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath "config" .. "/undodir"
vim.opt.undofile = true
