local augroup = vim.api.nvim_create_augroup("LspFormatting",{})
local null = require("null-ls")

local opts = {
  sources = {
    null.builtins.formatting.prettierd,
    null.builtins.diagnostics.mypy,
    null.builtins.diagnostics.ruff,
    null.builtins.diagnostics.black,
  },
  on_attach = function (client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre",{
        group = augroup,
        buffer = bufnr,
        callback = function ()
          vim.lsp.buf.format({bufnr = bufnr})
        end
      })
    end
  end
}

return opts
