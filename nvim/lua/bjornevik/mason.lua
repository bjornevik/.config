require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = {
    "astro",
    "eslint",
    "gopls",
    "lua_ls",
    "marksman",
    "ocamllsp",
    "rust_analyzer",
    "tailwindcss",
    "tsserver",
    "vuels",
  },
}

require "bjornevik.lsp"
