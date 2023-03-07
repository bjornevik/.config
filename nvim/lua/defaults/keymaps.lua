-- Copies and Pastes
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { noremap = true })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { noremap = true })
vim.keymap.set("n", "<leader>Y", '"+Y', { noremap = true })
vim.keymap.set("n", "<leader>P", '"+P', { noremap = true })

-- Keep it centered
vim.keymap.set("n", "n", "nzzzv", { noremap = true })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })

-- Moving text
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("n", "<M-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<M-k>", ":m .-2<CR>==", { noremap = true, silent = true })

-- Undo Break points
vim.keymap.set("i", ",", ",<C-g>u", { noremap = true })
vim.keymap.set("i", ".", ".<C-g>u", { noremap = true })
vim.keymap.set("i", "!", "!<C-g>u", { noremap = true })
vim.keymap.set("i", "?", "?<C-g>u", { noremap = true })

-- Increments & Decrements
vim.keymap.set({ "n", "x" }, "+", "<C-a>", { noremap = true })
vim.keymap.set({ "n", "x" }, "-", "<C-x>", { noremap = true })
vim.keymap.set("x", "g+", "g<C-a>", { noremap = true })
vim.keymap.set("x", "g-", "g<C-x>", { noremap = true })

-- Fast buffer switching
vim.keymap.set("n", "<Backspace>", "<C-^>", { noremap = true })

-- Execute macro over visual line selections
vim.keymap.set("x", "Q", ":'<,'>:normal @q<CR>", { noremap = true, silent = true })

-- Disable Command history & EX mode
vim.keymap.set("n", "Q", "<nop>", { noremap = true })

-- Substitute under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { noremap = true })
