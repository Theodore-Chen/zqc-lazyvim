-- DAP (Debug Adapter Protocol) 配置
-- 用于 C/C++ 调试

return {
  "mfussenegger/nvim-dap",
  dependencies = {
    -- 安装 dap UI 插件，提供更好的调试界面
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap = require("dap")

    -- 创建便捷命令
    vim.api.nvim_create_user_command("DapLaunch", function()
      dap.continue()
    end, { desc = "Start DAP debugging" })

    vim.api.nvim_create_user_command("DapLaunchFile", function()
      local program = vim.fn.getcwd() .. "/build/" .. vim.fn.expand("%:t:r")
      dap.launch({ program = program })
    end, { desc = "Debug current file (build/)" })

    -- 配置 GDB 调试适配器
    dap.adapters.gdb = {
      type = "executable",
      command = "/usr/local/binutils-2_45/bin/gdb",
      args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
    }

    -- 配置 C++ 调试配置
    dap.configurations.cpp = {
      {
        name = "Launch",
        type = "gdb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = false,
      },
      {
        name = "Attach to process",
        type = "gdb",
        request = "attach",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        pid = function()
          local pid = vim.fn.input("PID: ", "")
          return tonumber(pid)
        end,
        cwd = "${workspaceFolder}",
      },
    }

    -- C 语言使用相同的配置
    dap.configurations.c = dap.configurations.cpp

    -- 设置 dap UI
    local dapui = require("dapui")
    dapui.setup()

    -- 自动打开/关闭 dap UI
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
  end,
  keys = {
    -- 调试快捷键
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, desc = "Conditional Breakpoint" },
    { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
    { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
    { "<leader>dg", function() require("dap").goto_() end, desc = "Go to Line" },
    { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
    { "<leader>do", function() require("dap").step_over() end, desc = "Step Over" },
    { "<leader>dO", function() require("dap").step_out() end, desc = "Step Out" },
    { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
    { "<leader>dr", function() require("dap").repl.open() end, desc = "REPL" },
    { "<leader>ds", function() require("dap").session() end, desc = "Session" },
    { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
    { "<leader>dw", function() require("dapui").toggle() end, desc = "DAP UI" },
  },
}
