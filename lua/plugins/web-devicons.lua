-- ~/.config/nvim/lua/plugins/web-devicons.lua
return {
  "nvim-tree/nvim-web-devicons",
  lazy = true, -- 延迟加载
  opts = {
    -- 可自定义图标（可选配置）
    override = {
      c = { icon = "", name = "c" },
      cpp = { icon = "", name = "cpp" },
    },
  },
}
