local M      = {}

M.is_mac     = vim.fn.has("mac") == 1
M.is_windows = vim.fn.has("win32") == 1
M.is_linux   = vim.fn.has("linux") == 1
M.is_neovide = vim.g.neovide ~= nil

return M
