local has_lualine, lualine = pcall(require, "lualine")
if not has_lualine then
  return
end

lualine.setup {
  options = {
    theme = "gruvbox-baby",
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      "mode",
    },
    lualine_b = {
      {
        "branch",
        icon = "",
      },
      "diff",
      "diagnostics",
    },
    lualine_x = {
      "encoding",
      "filename",
      "filetype",
    },
    lualine_y = {
      "progress",
    },
    lualine_z = {
      {
        "location",
        icon = "",
      },
    },
  },
}
