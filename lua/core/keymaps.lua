-- Keymaps

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Basic
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)
map("n", "<leader>h", ":nohlsearch<CR>", opts)

-- Window navigation (optional)
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Option + Arrow
map("i", "<M-b>", "<C-o>b", opts)
map("i", "<M-f>", "<C-o>w", opts)
map("n", "<M-b>", "b", opts)
map("n", "<M-f>", "w", opts)

--  Command + Arrow
map("n", "<Home>", "0", opts)
map("n", "<End>", "$", opts)
map("n", "<leader><Up>", "gg", opts)
map("n", "<leader><Down>", "G", opts)

-- Selections
vim.keymap.set("x", "<M-S-Left>", "b", opts)
vim.keymap.set("x", "<M-S-Right>", "w", opts)
vim.keymap.set("n", "<M-S-Left>", "vb", opts)
vim.keymap.set("n", "<M-S-Right>", "vw", opts)

-- Copy / Paste
vim.keymap.set({ "n", "v" }, "<leader>c", '"+y', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>v", '"+p', { noremap = true, silent = true })
vim.keymap.set("v", "<leader>v", '"+p', { noremap = true, silent = true })
vim.keymap.set("i", "<leader>v", '<C-r>+', { noremap = true, silent = true })

-- Undo / Redo
vim.keymap.set("n", "<Esc>u", "u", { noremap = true, silent = true })
vim.keymap.set("v", "<Esc>u", "u", { noremap = true, silent = true })
vim.keymap.set("i", "<Esc>u", "<C-o>u", { noremap = true, silent = true })

vim.keymap.set("n", "<Esc>r", "<C-r>", { noremap = true, silent = true })
vim.keymap.set("v", "<Esc>r", "<C-r>", { noremap = true, silent = true })
vim.keymap.set("i", "<Esc>r", "<C-o><C-r>", { noremap = true, silent = true })

