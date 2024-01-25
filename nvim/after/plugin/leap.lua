local has_leap, leap = pcall(require, "leap")
if has_leap then
  -- leap.create_default_mappings()
  vim.keymap.set({ "n", "x" }, "s", "<Plug>(leap-forward)", { noremap = false })
  vim.keymap.set("n", "S", "<Plug>(leap-backward)", { noremap = false })
  vim.keymap.set("x", "<C-s>", "<Plug>(leap-backward)", { noremap = false })
  vim.keymap.set("n", "gs", "<Plug>(leap-backward)", { noremap = false })
end

local has_flit, flit = pcall(require, "flit")
if has_flit then
  flit.setup {}
end

local has_spooky, spooky = pcall(require, "leap-spooky")
if has_spooky then
  spooky.setup {}
end
