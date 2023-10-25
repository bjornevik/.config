local has_highlight_colors, highlight_colors = pcall(require, "nvim-highlight-colors")
if not has_highlight_colors then
  return
end

highlight_colors.setup {
  enable_tailwind = true,
}
