-- clangd LSP 配置
-- 提供 C/C++ 语言服务、AST 可视化、Symbol Info、Type Hierarchy 等功能

-- 创建全局的 inlay hint toggle 命令
vim.api.nvim_create_user_command("InlayHintsToggle", function()
    local is_enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
    vim.lsp.inlay_hint.enable(not is_enabled, { bufnr = 0 })
end, { desc = "Toggle LSP Inlay Hints" })

local on_attach = function(client, bufnr)
    -- 默认禁用 inlay hints
    if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
    end
end

return {
    -- clangd LSP 服务器配置
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                clangd = {
                    cmd = {
                        "clangd",
                        "--background-index",
                        "--clang-tidy",
                        "--header-insertion=never",    -- 禁用自动插入头文件
                        "--all-scopes-completion",     -- 全局符号补全
                        "--completion-style=detailed", -- 详细补全提示
                        "--cross-file-rename",         -- 跨文件重命名
                        "--malloc-trim",               -- 内存优化
                    },
                    init_options = {
                        usePlaceholders = true,
                        completeUnimported = true,
                        clangdFileStatus = true,
                    },
                    mason = false,
                    on_attach = on_attach,
                },
            },
        },
    },

    -- clangd_extensions 插件配置
    -- 提供 AST 可视化、Symbol Info、Type Hierarchy、Memory Usage 等扩展功能
    {
        "p00f/clangd_extensions.nvim",
        opts = {
            inlay_hints = {
                enable = false,  -- 禁用 inlay hints
            },
        },
        keys = {
            { "<leader>ca", "<cmd>ClangdAST<cr>", desc = "Clangd AST" },
            { "<leader>ci", "<cmd>InlayHintsToggle<cr>", desc = "Toggle Inlay Hints" },
            { "<leader>cs", "<cmd>ClangdSymbolInfo<cr>", desc = "Clangd Symbol Info" },
            { "<leader>ct", "<cmd>ClangdTypeHierarchy<cr>", desc = "Clangd Type Hierarchy" },
            { "<leader>cm", "<cmd>ClangdMemoryUsage<cr>", desc = "Clangd Memory Usage" },
        },
    },
}
