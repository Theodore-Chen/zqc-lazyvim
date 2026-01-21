-- ~/.config/nvim/lua/plugins/aerial.lua

return {
    "stevearc/aerial.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    cmd = "AerialToggle",
    keys = {
        { "<leader>o", "<cmd>AerialToggle<CR>", desc = "Toggle Aerial Outline" },
    },
    opts = {
        backends = { "lsp", "treesitter" },
        layout = {
            default_direction = "right",
            width = 30,
        },
        show_guides = true,
        highlight_on_hover = true,
        filter_kind = false,
        lsp = {
            update_delay = 200,
        },
    },
}
