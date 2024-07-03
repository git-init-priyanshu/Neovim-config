local cmp = require "cmp"
local luasnip = require "luasnp"

cmp.setup {
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = {
    ["<C-k>"] = cmp.mapping.select_next_item(),
    ["<C-j>"] = cmp.mapping.select_prev_item(),
  },
}

-- `/` cmdline setup.
cmp.setup.cmdline("/", {
  mapping = {
    ["<C-k>"] = cmp.mapping.select_next_item(),
    ["<C-j>"] = cmp.mapping.select_prev_item(),
  },
  sources = {
    { name = "buffer" },
  },
})
-- `:` cmdline setup.
cmp.setup.cmdline(":", {
  mapping = {
    ["<C-k>"] = cmp.mapping.select_next_item(),
    ["<C-j>"] = cmp.mapping.select_prev_item(),
  },
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    {
      name = "cmdline",
      option = {
        ignore_cmds = { "Man", "!" },
      },
    },
  }),
})
