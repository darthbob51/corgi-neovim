return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dap.listeners.after.event_initialized["dapui"] = function()
      dapui.open()
    end

    require("dapui").setup({
      layouts = {
        {
          elements = {
            { id = "console", size = 0.5 },
          },
          size = 10,
          position = "bottom",
        },
      },

      controls = {
        enabled = false,
      },
    })
    require("mason-nvim-dap").setup({
      ensure_installed = { "codelldb" },
      handlers = {
        function(config)
          require("mason-nvim-dap").default_setup(config)
        end,
      },
    })

    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = "codelldb",
        args = { "--port", "${port}" },
      },
    }

    dap.configurations.rust = {
      {
        name = "Debug (cargo)",
        type = "codelldb",
        request = "launch",
        program = function()
          vim.fn.system({ "cargo", "build" })

          return vim.fn.input(
            "Executable: ",
            vim.fn.getcwd() .. "/target/debug/",
            "file"
          )
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        env = { RUST_BACKTRACE = "full" },
      },
    }

    local map = vim.keymap.set
    map("n", "<F5>", dap.continue, { desc = "DAP continue" })
    map("n", "<leader>so", dap.step_over, { desc = "DAP step over" })
    map("n", "<leader>si", dap.step_into, { desc = "DAP step into" })
    map("n", "<leader>sO", dap.step_out, { desc = "DAP step out" })
    map("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP breakpoint" })
    map("n", "<leader>dB", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, { desc = "DAP conditional breakpoint" })
    map("n", "<leader>dr", dap.repl.open, { desc = "DAP repl" })
    map("n", "<leader>dl", dap.run_last, { desc = "DAP run last" })
    map("n", "<leader>dx", dap.terminate, { desc = "DAP terminate" })
  end,
}
