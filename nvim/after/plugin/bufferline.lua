local has_bufferline, bufferline = pcall(require, "bufferline")
if not has_bufferline then
  return
end

bufferline.setup {
  options = {
    diagnostics = "nvim_lsp",
    separator_style = "slant",
  },
}

vim.keymap.set("n", "<M-h>", ":BufferLineMovePrev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-l>", ":BufferLineMoveNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gb", ":BufferLinePick<CR>", { noremap = true, silent = true })
