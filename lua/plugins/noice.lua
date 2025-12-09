-- Plugin for setup command palette while pressing :

return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    presets = {
      command_palette = true,
    },
  },
}

