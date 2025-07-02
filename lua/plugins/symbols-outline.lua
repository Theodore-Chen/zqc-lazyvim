-- ~/.config/nvim/lua/plugins/outline.lua
return {
  "simrat39/symbols-outline.nvim",
  cmd = "SymbolsOutline", -- 推荐使用 cmd 来延迟加载，只在执行命令时才加载插件
  keys = {
    {
      "<leader>o", -- leader + o (s for symbols, o for outline)
      "<cmd>SymbolsOutline<CR>",
      desc = "Toggle Symbols Outline", -- which-key 描述
    },
  },
  config = function()
    require("symbols-outline").setup({
      -- 你可以在这里进行自定义配置
      -- 默认配置已经非常好了，以下是一些常用选项
      highlight_hovered_item = true, -- 高亮鼠标悬停的项目
      show_guides = true, -- 显示连接线，使树状结构更清晰
      position = "right", -- 窗口位置，可以是 'left' 或 'right'
      width = 20, -- 窗口宽度
      auto_close = false, -- 离开大纲窗口时是否自动关闭
      symbols = { -- 自定义不同符号的图标，需要你有 Nerd Fonts 字体
        File = { icon = "󰈔", hl = "TSPunctDelimiter" },
        Module = { icon = "", hl = "TSNamespace" },
        Namespace = { icon = "", hl = "TSNamespace" },
        Package = { icon = "", hl = "TSNamespace" },
        Class = { icon = "", hl = "TSType" },
        Method = { icon = "", hl = "TSMethod" },
        Property = { icon = "󰜎", hl = "TSMethod" },
        Field = { icon = "", hl = "TSField" },
        Constructor = { icon = "", hl = "TSMethod" },
        Enum = { icon = "", hl = "TSType" },
        Interface = { icon = "", hl = "TSType" },
        Function = { icon = "󰊕", hl = "TSFunction" },
        Variable = { icon = "󰀫", hl = "TSConstant" },
        Constant = { icon = "󰀫", hl = "TSConstant" },
        String = { icon = "𝓐", hl = "TSString" },
        Number = { icon = "", hl = "TSNumber" },
        Boolean = { icon = "⊨", hl = "TSBoolean" },
        Array = { icon = "󰅪", hl = "TSConstant" },
        Object = { icon = "⦿", hl = "TSType" },
        Key = { icon = "🔑", hl = "TSType" },
        Null = { icon = "NULL", hl = "TSComment" },
        EnumMember = { icon = "", hl = "TSField" },
        Struct = { icon = "", hl = "TSType" },
        Event = { icon = "", hl = "TSType" },
        Operator = { icon = "󰆕", hl = "TSOperator" },
        TypeParameter = { icon = "", hl = "TSParameter" },
      },
    })
  end,
}
