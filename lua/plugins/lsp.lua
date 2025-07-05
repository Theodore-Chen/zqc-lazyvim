local on_attach = function(client, bufnr)
  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
    vim.keymap.set("n", "<leader>ch", function()
      local is_enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
      vim.lsp.inlay_hint.enable(not is_enabled, { bufnr = bufnr })
    end, { buffer = bufnr, desc = "Toggle LSP Inlay Hints" })
  end
end

return {
  {
    "neovim/nvim-lspconfig",
    ft = { "cpp", "c" }, -- 仅对 C/C++ 文件加载
    opts = {
      servers = {
        clangd = {
          cmd = {
            "clangd",
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
          on_attach = on_attach,
        },
      },
    },
  },
}
