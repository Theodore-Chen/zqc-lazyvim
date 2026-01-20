local on_attach = function(client, bufnr)
    if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
        vim.keymap.set("n", "<leader>ci", function()
            local is_enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
            vim.lsp.inlay_hint.enable(not is_enabled, { bufnr = bufnr })
        end, { buffer = bufnr, desc = "Toggle LSP Inlay Hints" })
    end
end

return {
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
                lua_ls = {
                    settings = {
                        Lua = {
                            runtime = {
                                version = "LuaJIT",
                            },
                            diagnostics = {
                                globals = { "vim" },
                            },
                            workspace = {
                                library = vim.api.nvim_get_runtime_file("", true),
                                checkThirdParty = false,
                            },
                            type = {
                                castNumberToInteger = true,
                            },
                        },
                    },
                },
            },
        },
    },
}
