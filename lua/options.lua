require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt ='both' -- to enable cursorline!

vim.g.lazyvim_prettier_needs_config = false
vim.opt.clipboard = ""

-- Keep Treesitter colors dominant in TS/TSX buffers
vim.hl.priorities.semantic_tokens = 95
