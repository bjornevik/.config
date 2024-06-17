local has_neodev, neodev = pcall(require, "neodev")
if has_neodev then
  neodev.setup {}
end

local has_lspconfig, lspconfig = pcall(require, "lspconfig")
if not has_lspconfig then
  return
end

-- LSP settings
local on_attach = function(client)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
  vim.keymap.set("n", "gr", function()
    require("trouble").toggle "lsp_references"
  end, { buffer = 0 })
  vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
  vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { buffer = 0 })
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = 0 })
  vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { buffer = 0 })
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
  vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, { buffer = 0 })
  vim.keymap.set("n", "<leader>ds", function()
    require("trouble").toggle "lsp_document_symbols"
  end, { buffer = 0 })
  if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
    -- vim.lsp.inlay_hint.enable()
    vim.keymap.set("n", "<leader>lh", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled {})
    end, { buffer = 0 })
  end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.colorProvier = {
  dynamicRegistration = true,
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    gopls = {
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParamters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
}
lspconfig.marksman.setup { on_attach = on_attach, capabilities = capabilities }
lspconfig.vimls.setup { on_attach = on_attach, capabilities = capabilities }
lspconfig.bufls.setup { on_attach = on_attach, capabilities = capabilities } -- proto
lspconfig.volar.setup { on_attach = on_attach, capabilities = capabilities }
lspconfig.astro.setup { on_attach = on_attach, capabilities = capabilities }
lspconfig.tailwindcss.setup { on_attach = on_attach, capabilities = capabilities }
lspconfig.ocamllsp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    codelens = { enable = true },
    inlayHints = { enable = true },
  },
}

require("rust-tools").setup {
  server = {
    standalone = true,
    on_attach = on_attach,
    -- capabilities = capabilities,
    -- cmd = { "rustup", "run", "nightly", "rust-analyzer" },
  },
  dap = {
    adapter = {
      type = "executable",
      -- command = "lldb-vscode",
      command = "/usr/local/Cellar/llvm/14.0.6_1/bin/lldb-vscode",
      name = "rt_lldb",
    },
  },
}

-- neodev for lua
if has_neodev then
  lspconfig.lua_ls.setup {
    settings = {
      Lua = {
        completion = {
          callSnippet = "Replace",
        },
        hint = {
          enable = true,
        },
      },
    },
  }
end

-- tsserver specific setup
-- https://github.com/typescript-language-server/typescript-language-server/issues/216#issuecomment-1005272952
local function filter(arr, fn)
  if type(arr) ~= "table" then
    return arr
  end

  local filtered = {}
  for k, v in pairs(arr) do
    if fn(v, k, arr) then
      table.insert(filtered, v)
    end
  end

  return filtered
end

local function filterReactDTS(value)
  return string.match(value.targetUri, "react/index.d.ts") == nil
end

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = {
    ["textDocument/definition"] = function(err, result, method, ...)
      if vim.tbl_islist(result) and #result > 1 then
        local filtered_result = filter(result, filterReactDTS)
        return vim.lsp.handlers["textDocument/definition"](err, filtered_result, method, ...)
      end

      vim.lsp.handlers["textDocument/definition"](err, result, method, ...)
    end,
  },
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = false,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = false,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
  },
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
        languages = { "javascript", "typescript", "vue" },
      },
    },
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "vue",
  },
}

-- Diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  signs = {
    severity = { min = vim.diagnostic.severity.ERROR },
  },
  virtual_text = {
    severity = { min = vim.diagnostic.severity.WARN },
    spacing = 2,
    prefix = "",
  },
  update_in_insert = true,
})

-- ESLint
require("lspconfig").eslint.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Folke/Trouble.nvim
vim.keymap.set("n", "<C-q>", function()
  require("trouble").toggle "quickfix"
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>q", function()
  require("trouble").toggle "diagnostics"
end, { noremap = true, silent = true })

vim.keymap.set("n", "<C-j>", function()
  require("trouble").next { skip_groups = true, jump = true }
end, { noremap = true })

vim.keymap.set("n", "<C-k>", function()
  require("trouble").prev { skip_groups = true, jump = true }
end, { noremap = true })

-- return on_attach and capabilities so they can be used in instantiating other LSPs in other files (i.e. flutter-tools)
return {
  on_attach = on_attach,
  capabilities = capabilities,
}
