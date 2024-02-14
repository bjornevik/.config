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
  vim.keymap.set("n", "gr", "<cmd>TroubleToggle lsp_references<CR>", { buffer = 0 })
  vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
  vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { buffer = 0 })
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = 0 })
  vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { buffer = 0 })
  vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { buffer = 0 })
  vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { buffer = 0 })
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
  vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, { buffer = 0 })

  if client.server_capabilities.codeLensProvider then
    vim.api.nvim_create_augroup("lsp_document_codelens", {})
    vim.api.nvim_create_autocmd("BufEnter", {
      group = "lsp_document_codelens",
      pattern = "*",
      callback = function()
        vim.lsp.codelens.refresh()
      end,
      desc = "refreshes codelenses on BufEnter",
      once = true,
    })
    vim.api.nvim_create_autocmd({ "BufWritePost", "CursorHold" }, {
      group = "lsp_document_codelens",
      pattern = "*",
      callback = function()
        vim.lsp.codelens.refresh()
      end,
      desc = "refreshes codelenses on BufWritePost",
    })
    vim.keymap.set("n", "<leader>lr", vim.lsp.codelens.run)
  end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.colorProvier = {
  dynamicRegistration = true,
}

lspconfig.gopls.setup { on_attach = on_attach, capabilities = capabilities }
lspconfig.marksman.setup { on_attach = on_attach, capabilities = capabilities }
lspconfig.vimls.setup { on_attach = on_attach, capabilities = capabilities }
lspconfig.vuels.setup { on_attach = on_attach, capabilities = capabilities }
lspconfig.astro.setup { on_attach = on_attach, capabilities = capabilities }
lspconfig.tailwindcss.setup { on_attach = on_attach, capabilities = capabilities }
lspconfig.ocamllsp.setup { on_attach = on_attach, capabilities = capabilities }

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

local function lspSymbol(name, icon)
  vim.fn.sign_define(
    "DiagnosticSign" .. name,
    { text = icon, texthl = "DiagnosticSign" .. name, numhl = "DiagnosticDefault" .. name }
  )
end
lspSymbol("Error", " ")
lspSymbol("Warning", " ")
lspSymbol("Hint", " ")
lspSymbol("Information", " ")
lspSymbol("Info", " ")

-- Folke/Trouble.nvim
vim.keymap.set("n", "<C-q>", ":TroubleToggle quickfix<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>q", ":TroubleToggle document_diagnostics<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-j>", function()
  require("trouble").next { skip_groups = true, jump = true }
end, { noremap = true })

vim.keymap.set("n", "<C-k>", function()
  require("trouble").previous { skip_groups = true, jump = true }
end, { noremap = true })

-- return on_attach and capabilities so they can be used in instantiating other LSPs in other files (i.e. flutter-tools)
return {
  on_attach = on_attach,
  capabilities = capabilities,
}
