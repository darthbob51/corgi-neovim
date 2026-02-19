return {
  "akinsho/git-conflict.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("git-conflict").setup({
      default_mappings = true,
      default_commands = true,
      disable_diagnostics = false,
      highlights = {
        incoming = "DiffAdd",
        current = "DiffText",
      },
    })
  end,
}
