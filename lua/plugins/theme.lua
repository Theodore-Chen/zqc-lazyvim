-- ~/.config/nvim/lua/plugins/theme.lua

return {
    {
        "Mofiqul/vscode.nvim",
        lazy = false,    -- 主题必须在启动时加载
        priority = 1000, -- 确保优先加载
        config = function()
            require("vscode").load("dark")
            vim.cmd.colorscheme("vscode")
        end,
    },
}
