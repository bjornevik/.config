local has_gitsigns, gitsigns = pcall(require, "gitsigns")
if not has_gitsigns then
  return
end

gitsigns.setup {
  current_line_blame_formatter_opts = {
    relative_time = true,
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    map("n", "<leader>gB", gs.toggle_current_line_blame)
    map("n", "<leader>gd", gs.diffthis)
  end,
}
