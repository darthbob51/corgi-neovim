local M = {}

M.select = {
  ["af"] = "@function.outer",
  ["if"] = "@function.inner",
  ["ac"] = "@class.outer",
  ["ic"] = "@class.inner",
  ["aa"] = "@parameter.outer",
  ["ia"] = "@parameter.inner",
}

M.move_next_start = {
  ["]m"] = "@function.outer",
  ["]c"] = "@class.outer",
}

M.move_prev_start = {
  ["[m"] = "@function.outer",
  ["[c"] = "@class.outer",
}

M.swap_next = {
  ["<leader>a"] = "@parameter.inner",
}

M.swap_prev = {
  ["<leader>A"] = "@parameter.inner",
}

return M
