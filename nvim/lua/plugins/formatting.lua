return {
  {
    "stevearc/conform.nvim",
    lazy = false,
    config = function()
      local conform = require "conform"
      conform.setup {
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
        formatters_by_ft = {
          astro = { "prettierd", "prettier" },
          css = { "prettierd", "prettier" },
          go = { "gofmt" },
          html = { "prettierd", "prettier" },
          javascript = { "prettierd", "prettier" },
          json = { "jq" },
          lua = { "stylua" },
          markdown = { "prettierd", "prettier" },
          ocaml = { "ocamlformat " },
          rust = { "rustfmt" },
          typescript = { "prettierd", "prettier" },
          vue = { "prettierd", "prettier" },
        },
      }

      -- <leader>nf cause I used to use (n)eo(f)ormat
      vim.keymap.set("n", "<leader>nf", function()
        conform.format { async = true, lsp_fallback = true, stop_after_first = true }
      end, { desc = "Conform: format" })
    end,
  },
}
