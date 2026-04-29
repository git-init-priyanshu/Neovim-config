local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local util = require "lspconfig/util"
local lspconfig = require "lspconfig"

local has_native_api = vim.lsp and vim.lsp.config and vim.lsp.enable

local function setup_server(server, config)
  if has_native_api then
    vim.lsp.config[server] = config
    vim.lsp.enable(server)
    return
  end

  local server_config = lspconfig[server]
  if server_config then
    server_config.setup(config)
  end
end

-- List of simple servers
local servers = { "tailwindcss", "eslint", "html", "cssls", "prismals", "gopls" }

-- Default servers
for _, server in ipairs(servers) do
  setup_server(server, {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  })
end

-- TypeScript/JavaScript (vtsls)
setup_server("vtsls", {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    complete_function_calls = true,
    vtsls = {
      enableMoveToFileCodeAction = true,
      autoUseWorkspaceTsdk = true,
      experimental = {
        completion = {
          enableServerSideFuzzyMatch = true,
          entriesLimit = 20,
        },
      },
    },
    typescript = {
      updateImportsOnFileMove = { enabled = "always" },
    },
  },
})

-- Python (pyright)
setup_server("pyright", {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
})

-- Golang (gopls)
setup_server("gopls", {
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
})

setup_server("rust_analyzer", {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_dir = util.root_pattern("Cargo.toml", ".git"),
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        command = "clippy",
      },
    },
  },
})
