-- ~/.config/nvim/lua/plugins/markdown.lua

return {
    -- Markdown 文件类型配置
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            if type(opts.ensure_installed) == "table" then
                vim.list_extend(opts.ensure_installed, { "markdown", "markdown_inline" })
            end
        end,
    },

    -- Markdown 文件本地选项
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        opts = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "markdown",
                callback = function()
                    vim.opt_local.wrap = true
                    vim.opt_local.linebreak = true
                    vim.opt_local.textwidth = 0
                    vim.opt_local.conceallevel = 2
                    vim.opt_local.spell = true
                    vim.opt_local.spelllang = { "en", "cjk" }
                end,
            })
        end,
    },

    -- 禁用浏览器预览（使用内置render-markdown）
    {
        "iamcco/markdown-preview.nvim",
        enabled = false,
    },

    -- render-markdown.nvim配置（使用默认设置）
    {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {},
        ft = { "markdown", "norg", "rmd", "org", "codecompanion" },
        config = function(_, opts)
            require("render-markdown").setup(opts)
            -- 使用Snacks提供的切换功能
            Snacks.toggle({
                name = "Render Markdown",
                get = require("render-markdown").get,
                set = require("render-markdown").set,
            }):map("<leader>um")
        end,
    },

    -- 添加Markdown相关快捷键
    {
        "folke/which-key.nvim",
        opts = {
            spec = {
                { "<leader>m", group = "Markdown" },
            },
        },
    },

    -- 拼写检查快捷键
    {
        "neovim/nvim-lspconfig",
        opts = {
            keys = {
                { "<leader>ms", function() vim.cmd("spell") end, desc = "Toggle Spell", mode = { "n" } },
                { "<leader>mn", "]s", desc = "Next Spelling Error", mode = { "n" } },
                { "<leader>mp", "[s", desc = "Previous Spelling Error", mode = { "n" } },
                { "z=", desc = "Spelling Suggestions", mode = { "n" } },
            },
        },
    },
}
