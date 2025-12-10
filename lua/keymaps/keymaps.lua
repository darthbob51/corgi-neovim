vim.opt.keymodel = "startsel,stopsel"
vim.opt.selectmode = "mouse,key"
vim.opt.selection = "exclusive"

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.clipboard = "unnamedplus"

-- Duplicate Line (Cmd + D)
vim.keymap.set("n", "<leader>d", "yyp", { desc = "Duplicate line" })
vim.keymap.set({ "v", "s" }, "<leader>d", "yP", { desc = "Duplicate selection" })

vim.keymap.set({ "n", "v", "s" }, "<leader>s", "<cmd>w<CR>", { desc = "Save file" })
vim.keymap.set({ "n", "v", "s" }, "<leader>a", "<Esc>ggVG", { desc = "Select All" })

