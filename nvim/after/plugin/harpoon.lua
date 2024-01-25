local has_harpoon, harpoon = pcall(require, "harpoon")
if not has_harpoon then
  return
end

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>m", function()
  harpoon:list():append()
end)
vim.keymap.set("n", "<leader>hm", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<leader>1", function()
  harpoon:list():select(1)
end)
vim.keymap.set("n", "<leader>2", function()
  harpoon:list():select(2)
end)
vim.keymap.set("n", "<leader>3", function()
  harpoon:list():select(3)
end)
vim.keymap.set("n", "<leader>4", function()
  harpoon:list():select(4)
end)
vim.keymap.set("n", "<leader>5", function()
  harpoon:list():select(5)
end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<leader>hn", function()
  harpoon:list():prev()
end)
vim.keymap.set("n", "<leader>hp", function()
  harpoon:list():next()
end)
