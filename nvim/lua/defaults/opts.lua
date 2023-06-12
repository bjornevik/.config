vim.opt.path:append "**"
vim.opt.wildmode = { "longest", "full" }
vim.opt.wildignore:append {
  "*.pyc",
  "*_build/*",
  "**/coverage/*",
  "**/node_modules/*",
  "**/android/*",
  "**/ios/*",
  "**/.git/*",
  "**/.go/*",
}
vim.opt.errorbells = false
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.encoding = "utf-8"
vim.opt.mouse = "a"
vim.opt.scrolloff = 8
if vim.g.vscode then
  vim.opt.cursorline = false
  vim.opt.cursorline = false
else
  vim.opt.cursorline = true
  vim.opt.cursorcolumn = true
end
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath "config" .. "/undodir"
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.updatetime = 200
vim.opt.cmdheight = 2
vim.opt.formatoptions:remove { "c", "r", "o" }
vim.opt.colorcolumn = "80"
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.completeopt = { "menuone", "noinsert", "noselect" }
vim.opt.shortmess:append "c"
vim.g.completion_matching_strategy_list = { "exact", "substring", "fuzzy" }
vim.opt.signcolumn = "yes"
-- FOLDS, see after/plugin/ufo.lua
vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.statuscolumn = "%s%=%{&nu?(&rnu&&v:relnum?v:relnum:v:lnum):''} %#FoldColumn#%{"
  .. "foldlevel(v:lnum) > foldlevel(v:lnum - 1)"
  .. "? foldclosed(v:lnum) == -1"
  .. '? ""'
  .. ': ""'
  .. ':" "}'
-- LISTCHARS, see after/plugin/indent-blankline.lua
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "tab:» "
vim.opt.listchars:append "trail:~"
