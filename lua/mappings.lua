require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set

-- My keymaps
map("i", "kj", "<Esc>") -- Exit insert mode
map({ "n", "i", "v" }, "<C-s>", "<cmd> :Format <cr>") -- Ctrl - S saves and formats
map("i", "^H", "<C-W>", { desc = "Delete previous word", noremap = true, silent = true })
map({ "n", "v" }, "<tab>", ">0") -- Indent line(s)
map({ "n", "v" }, "<S-tab>", "<0") -- Outdent line(s)

map({ "n", "v" }, "<S-h>", "^")
map({ "n", "v" }, "<S-l>", "$")
map({ "n", "v" }, "<S-j>", "5j")
map({ "n", "v" }, "<S-k>", "5k")

-- Paste over selection WITHOUT affecting clipboard
map("v", "<leader>p", '"_dP')

-- Tmux keymaps
map("n", "<C-h>", "<cmd> TmuxNavigateLeft <CR>", { desc = "window left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight <CR>", { desc = "window right" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown <CR>", { desc = "window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp <CR>", { desc = "window up" })

-- With wrap mode enabled, this will treat wrapped line as different line
map("n", "j", "gj")
map("n", "k", "gk")

-- Jump to errors
map("n", "e", vim.diagnostic.goto_next)
map("n", "E", vim.diagnostic.goto_prev)

-- Windown resize
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Integrated terminal
-- map({ "n" }, "<A-y>", function()
--   require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
-- end, { desc = "terminal new horizontal term" })

-- CLose tabs
map("n", "<leader>q", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })

-- Find selected word using telescope
map(
  "v",
  "<leader>fs",
  [[y:<C-u>lua require'telescope.builtin'.live_grep({ default_text = vim.fn.getreg('"') })<cr>]],
  { desc = "find seleced word" }
)

-- show details ( lsp )
map("n", "<leader>k", vim.lsp.buf.hover)

map("n", "<leader>u", "<cmd> :UndotreeToggle <cr>", { desc = "toggle undo tree" })

map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "nvimtree toggle window" })

-- Git preview change
map("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Previews changes of that perticular line" })

-- Toggle git blame
map("n", "<leader>gb", ":Git blame<CR>", { desc = "Toggles git blame window" })

-- Switch tabs using F11 / F12
vim.keymap.set("n", "<F11>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev", silent = true })

vim.keymap.set("n", "<F12>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next", silent = true })

map("n", "<leader>gs", vim.cmd.git, { desc = "open git panel" })

-- Primeagen keymaps
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Visual mode: send operations to system clipboard ( Doesn't pollutes the Raycast clipboard history )
local opts = { noremap = true, silent = true }
map("v", "y", '"+y', opts)
map("v", "d", '"+d', opts)
map("v", "c", '"+c', opts)
map("v", "x", '"+x', opts)
