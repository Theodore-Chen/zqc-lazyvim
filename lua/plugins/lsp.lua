return {
  {
    "neovim/nvim-lspconfig",
    ft = { "cpp", "c" }, -- 仅对 C/C++ 文件加载
    opts = {
      servers = {
        clangd = {
          cmd = {
            "/usr/bin/clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=never", -- 禁用自动插入头文件
            "--all-scopes-completion", -- 全局符号补全
            "--completion-style=detailed", -- 详细补全提示
            "--cross-file-rename", -- 跨文件重命名
            "--malloc-trim", -- 内存优化
          },
          capabilities = { offsetEncoding = "utf-8" },
          mason = false,
        },
      },
    },
  },
}
