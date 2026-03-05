return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  config = function()
    require("claudecode").setup()

    local function close_claude_terminal()
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        local name = vim.api.nvim_buf_get_name(buf)
        if vim.bo[buf].buftype == "terminal" and name:lower():match("claude") then
          vim.api.nvim_win_close(win, true)
        end
      end
    end

    local function real_win_count()
      local count = 0
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        local bt = vim.bo[buf].buftype
        local name = vim.api.nvim_buf_get_name(buf)
        local is_claude = bt == "terminal" and name:lower():match("claude")
        if not is_claude and bt ~= "nofile" and bt ~= "quickfix" then
          count = count + 1
        end
      end
      return count
    end

    vim.api.nvim_create_autocmd("QuitPre", {
      callback = function()
        if real_win_count() <= 1 then
          close_claude_terminal()
        end
      end,
    })

    vim.api.nvim_create_autocmd("BufDelete", {
      callback = function()
        vim.schedule(function()
          local listed = vim.fn.getbufinfo({ buflisted = 1 })
          local real = vim.tbl_filter(function(b)
            return vim.bo[b.bufnr].buftype == ""
          end, listed)
          if #real == 0 then
            close_claude_terminal()
          end
        end)
      end,
    })
  end,
  keys = require("keymaps.claude").keymaps,
}
