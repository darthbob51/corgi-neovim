local M = {}

M.keymaps = {
  { "<leader>cc", nil,                              desc = "AI/Claude Code" },
  { "<leader>af", "<cmd>ClaudeCodeFocus<cr>",       desc = "Focus Claude" },
  { "<leader>ac", "<cmd>ClaudeCode<cr>",            desc = "Toggle Claude" },
  { "<leader>ar", "<cmd>ClaudeCode --resume<cr>",   desc = "Resume Claude" },
  { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
  { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
  { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>",       desc = "Add current buffer" },
  { "<leader>as", "<cmd>ClaudeCodeSend<cr>",        desc = "Send to Claude" },
  {
    "<leader>as",
    "<cmd>ClaudeCodeTreeAdd<cr>",
    desc = "Add file",
    ft = { "neo-tree" },
  },
  -- Diff management
  { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
  { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>",   desc = "Deny diff" },
}

return M
