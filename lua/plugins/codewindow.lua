return {
  "gorbit99/codewindow.nvim",
  config = function()
    local codewindow = require("codewindow")
    codewindow.setup({
      -- 基本设置
      active_in_terminals = false, -- 不在终端中启用
      exclude_filetypes = { "NvimTree", "alpha" }, -- 排除文件类型
      use_treesitter = true, -- 使用 Treesitter 高亮
      use_lsp = true, -- 使用 LSP 数据

      -- 窗口外观
      width = 80, -- 迷你地图宽度
      window_border = "rounded", -- 窗口边框样式
      relative = "win", -- 相对于当前窗口
      position = "right", -- 显示在右侧
      z_index = 1, -- 图层层级

      -- 高亮设置（针对 C++ 优化）
      highlight_groups = {
        current_line = "CodewindowCursorLine",
        breakpoint = "DiagnosticSignError",
      },
    })

    -- 可选：设置快捷键（示例）
    vim.keymap.set("n", "<leader>mm", codewindow.toggle_minimap, { desc = "Toggle Code Minimap" })
  end,
}
