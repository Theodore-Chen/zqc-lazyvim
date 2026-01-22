return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            -- 禁用 LazyVim 的全局 inlay hints
            inlay_hints = {
                enabled = false,
            },
            servers = {
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
