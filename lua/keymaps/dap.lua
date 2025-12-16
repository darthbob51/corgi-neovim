local M = {}

M.keys = {
  { "<F5>",       function() require("dap").continue() end,          desc = "DAP continue" },
  { "<leader>so", function() require("dap").step_over() end,         desc = "DAP step over" },
  { "<leader>si", function() require("dap").step_into() end,         desc = "DAP step into" },
  { "<leader>sO", function() require("dap").step_out() end,          desc = "DAP step out" },
  { "<leader>bt", function() require("dap").toggle_breakpoint() end, desc = "DAP breakpoint" },
  { "<leader>fd", function() require("dapui").float_element() end,   desc = "DAP float menu" },
  { "<leader>fe", function() require("dapui").eval() end,            desc = "Evaluate expression" },
  {
    "<leader>bc",
    function()
      require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end,
    desc = "DAP conditional breakpoint",
  },
}

return M
