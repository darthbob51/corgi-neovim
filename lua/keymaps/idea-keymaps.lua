-- =============================================================================
-- NEOVIDE JETBRAINS KEYMAP
-- =============================================================================

local function set_map(modes, lhs, rhs, desc)
  vim.keymap.set(modes, lhs, rhs, { noremap = true, silent = true, desc = desc })
end

-- --------------------------------------------------
-- 1. SYSTEM & CLIPBOARD
-- --------------------------------------------------


-- Copy / Paste / Cut (Includes Select Mode 's')
set_map({ "v", "s" }, "<leader>c", '"+y', "Copy selection")
set_map("n", "<leader>c", '"+yy', "Copy line")
set_map({ "n", "v", "s" }, "<leader>v", '"+p', "Paste")
set_map("i", "<leader>v", '<C-r>+', "Paste in insert")
set_map("c", "<leader>v", '<C-r>+', "Paste in command")
set_map({ "v", "s" }, "<leader>x", '"+d', "Cut selection")
set_map("n", "<leader>x", '"+dd', "Cut line")

-- Undo / Redo (Includes Select Mode 's')
set_map({ "n", "v", "s" }, "<leader>z", "u", "Undo")
set_map("i", "<leader>z", "<C-o>u", "Undo in insert")
set_map({ "n", "v", "s" }, "<leader>Z", "<C-r>", "Redo")
set_map("i", "<leader>Z", "<C-o><C-r>", "Redo in insert")

-- --------------------------------------------------
-- 2. NAVIGATION & SELECTION
-- --------------------------------------------------

-- Option + Left/Right (Jump by Word)
set_map({ "n", "v", "s" }, "<A-Left>", "b", "Jump word left")
set_map({ "n", "v", "s" }, "<A-Right>", "e", "Jump word right")
set_map("i", "<A-Left>", "<C-o>b", "Jump word left")
set_map("i", "<A-Right>", "<C-o>e", "Jump word right")

-- Cmd + Left/Right (Start/End of Line)
set_map({ "n", "v", "s" }, "<leader>Left", "0", "Start of line")
set_map({ "n", "v", "s" }, "<leader>Right", "$", "End of line")
set_map("i", "<leader>Left", "<C-o>0", "Start of line")
set_map("i", "<leader>Right", "<C-o>$", "End of line")

-- Cmd + Up/Down (Top/Bottom of file)
set_map({ "n", "v", "s" }, "<leader>Up", "gg", "Top of file")
set_map({ "n", "v", "s" }, "<leader>Down", "G", "Bottom of file")
set_map("i", "<leader>Up", "<C-o>gg", "Top of file")
set_map("i", "<leader>Down", "<C-o>G", "Bottom of file")

-- Shift + Option + Arrows (Word Selection) - Uses Select Mode 'gh'
set_map("i", "<S-A-Left>", "<Esc>ghb", "Select Word Left")
set_map("i", "<S-A-Right>", "<Esc>ghe", "Select Word Right")
set_map("n", "<S-A-Left>", "ghb", "Select Word Left")
set_map("n", "<S-A-Right>", "ghe", "Select Word Right")
set_map({ "v", "s" }, "<S-A-Left>", "b", "Extend Word Left")
set_map({ "v", "s" }, "<S-A-Right>", "e", "Extend Word Right")

-- Shift + Cmd + Arrows (Line Selection) - Uses Select Mode 'gh'
set_map("i", "<S-D-Left>", "<Esc>gh0", "Select to Start")
set_map("i", "<S-D-Right>", "<Esc>gh$", "Select to End")
set_map("n", "<S-D-Left>", "gh0", "Select to Start")
set_map("n", "<S-D-Right>", "gh$", "Select to End")
set_map({ "v", "s" }, "<S-D-Left>", "0", "Extend to Start")
set_map({ "v", "s" }, "<S-D-Right>", "$", "Extend to End")

-- Cmd + W (Extend Selection) and Option + W (Shrink Selection)
set_map({ "n", "v", "s" }, "<leader>w", ":<C-u>lua require('nvim-treesitter.incremental_selection').node_incremental()<CR>", "Extend Selection")
set_map({ "n", "v", "s" }, "<A-w>", ":<C-u>lua require('nvim-treesitter.incremental_selection').node_decremental()<CR>", "Shrink Selection")


-- --------------------------------------------------
-- 3. EDITING ACTIONS
-- --------------------------------------------------

-- Cmd + Backspace (Delete to Line Start)
set_map("i", "<leader>BS", "<C-u>", "Delete to line start")
set_map("n", "<leader>BS", "d0", "Delete to line start")

-- Option + Backspace (Delete Word)
set_map("i", "<A-BS>", "<C-w>", "Delete word backward")
set_map("n", "<A-BS>", "db", "Delete word backward")

-- Backspace/Delete in Selection (Works in both Select and Visual Mode)
set_map("s", "<BS>", "<BS>", "Delete selection")
set_map("s", "<Del>", "<BS>", "Delete selection")
set_map("v", "<BS>", '"_d', "Delete selection")
set_map("v", "<Del>", '"_d', "Delete selection")

-- Comment Line (Cmd + /)
set_map("n", "<leader>/", "gcc", "Toggle comment")
set_map({ "v", "s" }, "<leader>/", "gc", "Toggle comment selection")
set_map("i", "<leader>/", "<C-o>gcc", "Toggle comment")

-- Find (Cmd + F) -> Search
set_map({ "n", "v", "s" }, "<leader>f", "/", "Find")
set_map("i", "<leader>f", "<Esc>/", "Find")

-- Replace (Cmd + R) -> Substitute
set_map("n", "<leader>r", ":%s/", "Replace")


-- --------------------------------------------------
-- 4. WINDOWS & TABS
-- --------------------------------------------------

-- Close Tab/Window
set_map("n", "<leader>q", ":q<CR>", "Quit")

-- New File (Cmd+N)
set_map("n", "<leader>n", ":enew<CR>", "New file")

-- Go to Definition (Cmd + B)
set_map("n", "<leader>b", "gd", "Go to definition")
