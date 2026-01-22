-- ~/.config/nvim/lua/plugins/theme.lua

-- 设置默认主题（修改这里切换主题）
local theme = "vscode"  -- 可选: "vscode", "tokyonight", "onedark", "catppuccin" 等

local theme_config = {
  vscode = {
    "Mofiqul/vscode.nvim",
    config = function()
      require("vscode").load("dark")
      vim.cmd.colorscheme("vscode")
    end,
  },
  tokyonight = {
    "folke/tokyonight.nvim",
    config = function()
      vim.cmd.colorscheme("tokyonight")
    end,
  },
  onedark = {
    "navarasu/onedark",
    config = function()
      require("onedark").setup({ style = "dark" })
      vim.cmd.colorscheme("onedark")
    end,
  },
}

return vim.tbl_extend("force", theme_config[theme], { lazy = false, priority = 1000 })
