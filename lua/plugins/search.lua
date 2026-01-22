-- 全局搜索和替换（类似 VSCode）
-- grug-far: 统一的搜索和替换工具

return {
  -- 禁用 telescope extra 的搜索快捷键
  {
    import = "lazyvim.plugins.extras.editor.telescope",
    keys = {
      -- 禁用这些快捷键
      { "<leader>sg", false },
      { "<leader>sw", false },
      { "<leader>sG", false },
      { "<leader>sW", false },
    },
  },
  -- grug-far 配置
  {
    "MagicDuck/grug-far.nvim",
    opts = {
      -- 启动时自动聚焦在搜索框
      startInInsertMode = true,
      -- 搜索结果在侧边显示
      transient = false,
    },
    cmd = { "GrugFar", "GrugFarWithin" },
    keys = {
      -- 主要搜索功能（覆盖 telescope）
      {
        "<leader>sg",
        function()
          require("grug-far").open({
            prefills = {
              paths = vim.fn.expand("%:p:h"),
            },
          })
        end,
        desc = "Search (Grug-Far)",
        mode = { "n", "v" },
      },
      {
        "<leader>sG",
        function()
          require("grug-far").open({
            prefills = {
              paths = vim.fn.getcwd(),
            },
          })
        end,
        desc = "Search (Root)",
      },
      -- 搜索单词
      {
        "<leader>sw",
        function()
          require("grug-far").open({
            prefills = {
              search = vim.fn.expand("<cword>"),
              paths = vim.fn.expand("%:p:h"),
            },
          })
        end,
        desc = "Search Word",
      },
      -- visual 模式下用命令处理选中文本
      {
        "<leader>sw",
        ":<C-u>GrugFar<CR>",
        desc = "Search Selection",
        mode = "v",
      },
    },
  },
}
