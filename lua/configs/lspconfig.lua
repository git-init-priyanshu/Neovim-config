local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local util = require "lspconfig/util"

-- List of simple servers
local servers = { "ts_ls", "tailwindcss", "eslint", "html", "cssls", "prismals", "gopls" }

-- Default servers
for _, server in ipairs(servers) do
  vim.lsp.config[server] = {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
  vim.lsp.enable(server)
end

-- Python (pyright)
vim.lsp.config.pyright = {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
}
vim.lsp.enable("pyright")

-- Golang (gopls)
vim.lsp.config.gopls = {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}
vim.lsp.enable("gopls")
