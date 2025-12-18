local M = {}


M.keys = {
  {
    "<leader>ff",
    function()
      require("telescope.builtin").find_files({ hidden = true })
    end,
    desc = "Find files",
  },
  {
    "<leader>e",
    function()
      require("telescope.builtin").oldfiles()
    end,
    desc = "Show old files",
  },
  {
    "<leader>F",
    function()
      require("telescope.builtin").live_grep()
    end,
    desc = "Live grep",
  },
  {
    "<leader>bb",
    function()
      require("telescope.builtin").buffers()
    end,
    desc = "Buffers",
  },
  {
    "<leader>bf",
    function()
      require("telescope.builtin").current_buffer_fuzzy_find()
    end,
    desc = "Search in current file",
  },
  {
    "<leader>hf",
    function()
      require("telescope.builtin").help_tags()
    end,
    desc = "Help tags",
  },
  {
    "<leader>AF",
    function()
      require("telescope.builtin").find_files({
        cwd = vim.loop.os_homedir(),
        hidden = true,
        no_ignore = true,
      })
    end,
    desc = "Global file search",
  },
  {
    "grd",
    function()
      require("telescope.builtin").lsp_definitions()
    end,
    desc = "LSP definitions",
  },
  {
    "grr",
    function()
      require("telescope.builtin").lsp_references()
    end,
    desc = "LSP references",
  },
  {
    "gri",
    function()
      require("telescope.builtin").lsp_implementations()
    end,
    desc = "LSP implementations",
  },
  {
    "grw",
    function()
      require("telescope.builtin").lsp_type_definitions()
    end,
    desc = "LSP type definitions",
  },
  {
    "grs",
    function()
      require("telescope.builtin").lsp_workspace_symbols()
    end,
    desc = "LSP workspace symbols",
  },
  {
    "<leader>xx",
    function()
      require("telescope.builtin").diagnostics()
    end,
    desc = "Diagnostics",
  },
  {
    "<leader>gs",
    function()
      require("telescope.builtin").git_status()
    end,
    desc = "Git status",
  },
  {
    "<leader>gc",
    function()
      require("telescope.builtin").git_commits()
    end,
    desc = "Git commits",
  },
  {
    "<leader>gb",
    function()
      require("telescope.builtin").git_branches()
    end,
    desc = "Git branches",
  },
  {
    "ga",
    function()
      vim.lsp.buf.code_action()
    end,
    desc = "Code Action",
  },
  {
    "rn",
    vim.lsp.buf.rename,
    desc = "Rename"
  },
  {
    "<leader>DL",
    function()
      require("telescope").extensions.dap.commands()
    end,
    desc = "DAP commands (Telescope)",
  },
  {
    "<leader>DBL",
    function()
      require("telescope").extensions.dap.list_breakpoints()
    end,
    desc = "DAP breakpoints list",
  },
  {
    "<leader>DF",
    function()
      require("telescope").extensions.dap.frames()
    end,
    desc = "DAP frames",
  },
  {
    "<leader>DV",
    function()
      require("telescope").extensions.dap.variables()
    end,
    desc = "DAP variables",
  },
  {
    "<leader>DC",
    function()
      require("telescope").extensions.dap.configurations()
    end,
    desc = "DAP configurations",
  },
  {
    ":",
    "<cmd>Telescope cmdline<CR>",
    desc = "Cmdline",
  },
  {
    "<leader><leader>",
    "<cmd>Telescope cmdline<CR>",
    desc = "Cmdline",
  },
}

return M
