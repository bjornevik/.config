local has_diffview, diffview = pcall(require, "diffview")
if not has_diffview then
  return
end

diffview.setup {
  view = {
    merge_tool = {
      layout = "diff3_mixed",
    },
  },
}
