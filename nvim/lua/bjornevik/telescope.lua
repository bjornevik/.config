local has_telescope, telescope = pcall(require, "telescope")
if not has_telescope then
  return
end

local actions = require "telescope.actions"
local telescope_sorters = require "telescope.sorters"
local telescope_previewers = require "telescope.previewers"
local telescope_builtin = require "telescope.builtin"

telescope.setup {
  defaults = {
    prompt_prefix = " > ",
    color_devicons = true,
    path_display = { "truncate" },
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    winblend = 0,
    layout_config = {
      horizontal = {
        preview_width = 0.55,
        results_width = 0.8,
      },
      width = 0.87,
      height = 0.8,
      preview_cutoff = 120,
    },

    file_sorter = telescope_sorters.get_fuzzy_file,
    generic_sorter = telescope_sorters.get_generic_fuzzy_sorter,
    file_ignore_patterns = {
      "undodir/.*",
      "node_modules/.*",
      -- "android/.*",
      -- "ios/.*",
      ".git/.*",
      ".dart_tool/.*",
      "debug/.*",
      "target/.*",
    },

    file_previewer = telescope_previewers.vim_buffer_cat.new,
    grep_previewer = telescope_previewers.vim_buffer_vimgrep.new,
    qflist_previewer = telescope_previewers.vim_buffer_qflist.new,

    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-q>"] = actions.send_to_qflist,
      },
    },
    preview = {
      treesitter = false,
    },
  },
  pickers = {
    buffers = {
      mappings = {
        i = {
          ["<C-r>"] = "delete_buffer",
        },
      },
    },
    find_files = {
      hidden = true,
    },
    live_grep = {
      hidden = true,
    },
    oldfiles = {
      hidden = true,
    },
    git_files = {
      hidden = true,
    },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = true,
      override_file_sorter = true,
    },
    file_browser = {
      hidden = true,
      mappings = {
        ["i"] = {
          ["<M-n>"] = require("telescope").extensions.file_browser.actions.create_from_prompt,
        },
      },
    },
  },
}

telescope.load_extension "fzy_native"
telescope.load_extension "flutter"
telescope.load_extension "file_browser"
require("refactoring").setup {}
telescope.load_extension "refactoring"
telescope.load_extension "undo"
telescope.load_extension "neoclip"

local M = {}
M.search_dotfiles = function()
  telescope_builtin.find_files {
    prompt_title = "< VimRC >",
    cwd = "~/.config/nvim",
    hidden = true,
  }
end

-- Telescope remaps
vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files, { noremap = true })
vim.keymap.set("n", "<leader>tb", telescope_builtin.buffers, { noremap = true })
vim.keymap.set("n", "<leader>fs", telescope_builtin.live_grep, { noremap = true })
vim.keymap.set("n", "<leader>bf", telescope_builtin.current_buffer_fuzzy_find, { noremap = true })
vim.keymap.set("n", "<leader>fo", telescope_builtin.oldfiles, { noremap = true })
vim.keymap.set("n", "<leader>fg", telescope_builtin.git_files, { noremap = true })
vim.keymap.set("n", "<leader>fh", telescope_builtin.help_tags, { noremap = true })
vim.keymap.set("n", "<leader>fr", telescope_builtin.lsp_references, { noremap = true })
vim.keymap.set("n", "<leader>fws", telescope_builtin.lsp_workspace_symbols, { noremap = true })
vim.keymap.set("n", "<leader>fds", telescope_builtin.lsp_document_symbols, { noremap = true })

vim.keymap.set("n", "<leader>fb", telescope.extensions.file_browser.file_browser, { noremap = true })
vim.keymap.set("n", "<leader>tu", telescope.extensions.undo.undo, { noremap = true })
vim.keymap.set("n", "<leader>vrc", M.search_dotfiles, { noremap = true })

-- Plugin specific remaps
vim.keymap.set(
  "v",
  "<leader>rr",
  "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
  { noremap = true }
)

vim.keymap.set("n", "<leader>fl", telescope.extensions.flutter.commands, { noremap = true })

return M
