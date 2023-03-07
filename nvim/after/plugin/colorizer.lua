local has_colorizer, colorizer = pcall(require, "colorizer")
if not has_colorizer then
  return
end

colorizer.setup {
  "css",
  "javascript",
  "typescript",
  "vue",
  "tsx",
  "jsx",
}
