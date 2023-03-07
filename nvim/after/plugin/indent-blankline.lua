local has_indent_blankline, indent_blankline = pcall(require, "indent_blankline")
if not has_indent_blankline then
  return
end

indent_blankline.setup {
  enabled = false,
  show_first_indent_level = false,
  use_treesitter = true,
  show_current_context = true,
  space_char_blankline = " ",
  filetype_exclude = { "alpha" },
}
