local ls = require "luasnip"
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local f = ls.function_node
local rep = require("luasnip.extras").rep

ls.add_snippets("vue", {
  s(
    "mapGetters",
    fmt(
      [[
      ...mapGetters({{
        {}: '{}',
      }}),
    ]],
      {
        f(function(import_name)
          local parts = vim.split(import_name[1][1], "/", true)
          return parts[#parts] or ""
        end, { 1 }),
        i(1, "example/example"),
      }
    )
  ),
  s(
    "getter",
    fmt(
      [[
    {}: '{}',
    ]],
      {
        f(function(import_name)
          local parts = vim.split(import_name[1][1], "/", true)
          return parts[#parts] or ""
        end, { 1 }),
        i(1, "example/example"),
      }
    )
  ),
})
