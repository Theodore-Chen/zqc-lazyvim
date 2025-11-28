-- ~/.config/nvim/lua/plugins/aerial.lua

return {
    "stevearc/aerial.nvim",
    -- 确保在 nvim-treesitter 和 lspconfig 之后加载
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons", -- 确保 devicons 在 aerial 之前加载
    },
    -- 仅在执行命令或快捷键时加载
    cmd = "AerialToggle",
    keys = {
        { "<leader>o", "<cmd>AerialToggle<CR>", desc = "Toggle Aerial Outline" },
    },
    opts = {
        -- backends = { "lsp" },
        backends = { "lsp", "treesitter", "markdown" },
        layout = {
            default_direction = "right",
            width = 35,
            min_width = 15,
            max_width = { 40, 0.2 },
        },

        show_guides = true,
        highlight_on_hover = true,
        filter_kind = false,

        lsp = {
            update_delay = 300,
        },
        treesitter = {
            ignore = { "comment", "string" },
        },

        -- =================================================================
        -- 以下选项使用默认值，无需配置
        -- =================================================================
        -- backends = { "lsp", "treesitter", "markdown" } -- 默认已启用，无需写
        -- icons = {} -- 不写！使用 nvim-web-devicons 提供的默认图标
        -- highlight_mode = "Lsp" -- 默认使用 LSP 高亮，效果很好
        -- on_attach = function(bufnr) ... end -- 默认已处理好跳转等功能
    },
}
