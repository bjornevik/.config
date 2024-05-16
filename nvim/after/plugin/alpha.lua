local has_alpha, alpha = pcall(require, "alpha")
if not has_alpha then
  return
end

local dashboard = require "alpha.themes.dashboard"
dashboard.section.header.val = {
  "                                                     ",
  "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
  "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
  "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
  "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
  "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
  "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
  "                                                     ",
}

dashboard.section.buttons.val = {
  dashboard.button("SPC f f", "  Find File", ":Telescope find_files<CR>"),
  dashboard.button("SPC f s", "  Find String", ":Telescope live_grep<CR>"),
  dashboard.button("SPC f b", "  File Browser", ":Oil<CR>"),
  dashboard.button("SPC h m", "  Harpoon", ":lua require('harpoon.ui').toggle_quick_menu()<CR>"),
  dashboard.button("SPC f h", "ﲉ  Help", ":Telescope help_tags<CR>"),
  dashboard.button("SPC f o", "勒 Recent", ":Telescope oldfiles<CR>"),
  dashboard.button("SPC vrc", "  Settings", ":lua require('bjornevik.telescope').search_dotfiles()<CR>"),
}

alpha.setup(dashboard.opts)
