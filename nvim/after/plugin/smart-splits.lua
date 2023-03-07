local has_smart_splits, smartsplits = pcall(require, "smart-splits")
if has_smart_splits then
  -- resize splits
  vim.keymap.set("n", "<M-Left>", smartsplits.resize_left)
  vim.keymap.set("n", "<M-Down>", smartsplits.resize_down)
  vim.keymap.set("n", "<M-Up>", smartsplits.resize_up)
  vim.keymap.set("n", "<M-Right>", smartsplits.resize_right)

  -- moving between splits
  vim.keymap.set("n", "<C-Left>", smartsplits.move_cursor_left)
  vim.keymap.set("n", "<C-Down>", smartsplits.move_cursor_down)
  vim.keymap.set("n", "<C-Up>", smartsplits.move_cursor_up)
  vim.keymap.set("n", "<C-Right>", smartsplits.move_cursor_right)
end
