return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  keys = {
    { "<leader>gv", "<cmd>DiffviewOpen<cr>", desc = "Git Diff View" },
    { "<leader>gc", "<cmd>DiffviewFileHistory<cr>", desc = "Git History" },
    { "<leader>gC", "<cmd>DiffviewFileHistory %<cr>", desc = "Git History (Current File)" },
  },
  opts = {
    enhanced_diff_hl = true,
    view = {
      merge_tool = {
        layout = "diff3_mixed",
      },
    },
  },
}
