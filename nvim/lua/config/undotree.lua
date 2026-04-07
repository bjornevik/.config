vim.cmd "packadd nvim.undotree"

vim.keymap.set("n", "<leader>ut", require("undotree").open, { desc = "Undotree: Open" })
