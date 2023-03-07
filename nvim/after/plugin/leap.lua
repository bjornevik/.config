vim.keymap.set("n", "s", "<Plug>(leap-forward)", { noremap = true })
vim.keymap.set("n", "S", "<Plug>(leap-backward)", { noremap = true })
vim.keymap.set("o", "x", "<Plug>(leap-forward)", { noremap = true })
vim.keymap.set("o", "X", "<Plug>(leap-backward)", { noremap = true })
vim.keymap.set("x", "x", "<Plug>(leap-forward-x)", { noremap = true })
vim.keymap.set("x", "X", "<Plug>(leap-backward-x)", { noremap = true })
vim.keymap.set("n", "gS", "<Plug>(leap-cross-window)", { noremap = true })
vim.keymap.set("x", "gS", "<Plug>(leap-cross-window)", { noremap = true })
vim.keymap.set("o", "gS", "<Plug>(leap-cross-window)", { noremap = true })

local has_flit, flit = pcall(require, "flit")
if has_flit then
  flit.setup {}
end

local has_spooky, spooky = pcall(require, "leap-spooky")
if has_spooky then
  spooky.setup {}
end
