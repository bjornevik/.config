local has_luasnip, ls = pcall(require, "luasnip")
if not has_luasnip then
  return
end

local types = require "luasnip.util.types"

require("luasnip/loaders/from_vscode").lazy_load() -- opts can be ommited

-- Expand the current item or jump to the next item within the snippet
vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

-- This always moves to the previous item within the snippet
vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

-- Selecting within a list of options
vim.keymap.set({ "i", "s" }, "<c-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

-- shortcut to source my luasnips file again, which will reload my snippets
vim.keymap.set("n", "<leader><leader>s", ":source ~/.config/nvim/after/plugin/luasnip.lua<CR>", { silent = true })

ls.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "<-", "Error" } },
      },
    },
  },
}

local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local f = ls.function_node

-- Custom snippet definitions
ls.add_snippets("all", {
  s(
    "curtime",
    f(function()
      return os.date "%Y-%m-%dT%H:%M:%S"
    end)
  ),
})

-- Lua only
ls.add_snippets("lua", {
  s(
    "req",
    fmt([[local {} = require "{}"]], {
      f(function(import_name)
        local parts = vim.split(import_name[1][1], ".", true)
        return parts[#parts] or ""
      end, { 1 }),
      i(1),
    })
  ),
})

require "snippets"
require "snippets"
