local has_treesitter, _ = pcall(require, "nvim-treesitter")
if not has_treesitter then
  return
end

require("nvim-treesitter.configs").setup {
  autotag = {
    enable = true,
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      -- init_selection = "gnn",
      -- node_incremental = "grn",
      -- scope_increamental = "grc",
      -- node_decremental = "grm",
      init_selection = "<C-n>",
      node_incremental = "<C-n>",
      scope_incremental = "<C-s>",
      node_decremental = "<C-p>",
    },
  },
  textobjects = {
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.vim
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@conditional.outer",
        ["ic"] = "@conditional.inner",
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
      },
    },
  },
  ensure_installed = {
    "astro",
    "bash",
    "css",
    "comment",
    "dart",
    "dockerfile",
    "gitcommit",
    "go",
    "gomod",
    "gowork",
    "graphql",
    "html",
    "javascript",
    "jsdoc",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
    "ocaml",
    "python",
    "query",
    "regex",
    "rust",
    "scheme",
    "scss",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
    "vue",
    "yaml",
  },
  playground = {
    enable = true,
    updatetime = 25,
    persist_queries = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}

require("Comment").setup {
  pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
}

require("neogen").setup {
  enabled = true,
}

vim.keymap.set("n", "<leader>ng", require("neogen").generate, { noremap = true })

require("ts-node-action").setup {
  vue = {
    ["attribute_value"] = require("ts-node-action.actions").conceal_string(),
  },
}

vim.keymap.set("n", "<Tab>", require("ts-node-action").node_action, { desc = "Trigger Node Action" })
vim.keymap.set("n", "<Leader><Tab>", require("treesj").toggle, { desc = "Trigger Tree splitjoin action" })
