-- AutoCommands
vim.api.nvim_create_augroup("bjornevik", {})

-- Centers current line vertically when entering INSERT mode
vim.api.nvim_create_autocmd("InsertEnter", {
  group = "bjornevik",
  pattern = "*",
  command = ":norm zz",
  desc = "Centers current line vertically when entering INSERT mode",
})

-- Removes whitespace at the ends of lines before saving
vim.api.nvim_create_autocmd("BufWritePre", {
  group = "bjornevik",
  pattern = "*",
  command = "%s/\\s\\+$//e",
  desc = "Removes whitespace at the ends of lines before saving",
})

-- Disable automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
vim.api.nvim_create_autocmd("FileType", {
  group = "bjornevik",
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove "o"
  end,
  desc = "Disable automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.",
})

-- Show diagnostic on cursor hover.
vim.api.nvim_create_autocmd("CursorHold", {
  group = "bjornevik",
  pattern = "*",
  callback = function()
    vim.diagnostic.open_float(0, { scope = "cursor", focusable = false, border = "rounded" })
  end,
  desc = "Show diagnostic on cursor hover.",
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = "bjornevik",
  pattern = "*",
  callback = function()
    require("vim.highlight").on_yank()
  end,
  desc = "Highlight on yank",
})
