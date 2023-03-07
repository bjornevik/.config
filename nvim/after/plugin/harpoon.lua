local has_harpoon, harpoon = pcall(require, "harpoon")
if not has_harpoon then
  return
end

harpoon.setup {
  nav_first_in_list = true,
  requires = { "nvim-lua/plenary" },
}

vim.keymap.set("n", "<leader>m", require("harpoon.mark").add_file, { noremap = true })
vim.keymap.set("n", "<leader>hm", require("harpoon.ui").toggle_quick_menu, { noremap = true })

vim.keymap.set("n", "<leader>1", function()
  require("harpoon.ui").nav_file(1)
end, { noremap = true })

vim.keymap.set("n", "<leader>2", function()
  require("harpoon.ui").nav_file(2)
end, { noremap = true })

vim.keymap.set("n", "<leader>3", function()
  require("harpoon.ui").nav_file(3)
end, { noremap = true })

vim.keymap.set("n", "<leader>4", function()
  require("harpoon.ui").nav_file(4)
end, { noremap = true })

vim.keymap.set("n", "<leader>5", function()
  require("harpoon.ui").nav_file(5)
end, { noremap = true })
