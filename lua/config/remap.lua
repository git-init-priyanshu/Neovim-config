vim.g.mapleader = " "

vim.keymap.set("n", "<leader>xe", vim.cmd.Ex)

-- My keymaps
vim.keymap.set({ "n", "v" }, "<S-h>", "^")
vim.keymap.set({ "n", "v" }, "<S-l>", "$")
vim.keymap.set("i", "kj", "<Esc>")
vim.keymap.set({ "n", "v" }, "<S-j>", "5j")
vim.keymap.set({ "n", "v" }, "<S-k>", "5k")
vim.keymap.set("i", "<C-H>", "<C-w>")
vim.keymap.set({ "n", "v", "i" }, "<C-s>", ":w<CR>")
vim.keymap.set("n", "<C-h>", "<C-w-h>") -- not working
vim.keymap.set("n", "<C-l>", "<C-w-l>") -- not working

-- Primeagen keymaps
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
