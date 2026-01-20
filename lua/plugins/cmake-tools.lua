return {
  "Civitasv/cmake-tools.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "folke/which-key.nvim",
  },
  keys = {
    { "<leader>mg", "<cmd>CMakeGenerate!<cr>", desc = "CMake: Generate" },
    { "<leader>mb", "<cmd>CMakeBuild<cr>", desc = "CMake: Build" },
    { "<leader>mB", "<cmd>CMakeBuildCurrentFile<cr>", desc = "CMake: Build File" },
    { "<leader>mt", "<cmd>CMakeSelectBuildTarget<cr>", desc = "CMake: Select Target" },
    { "<leader>mk", "<cmd>CMakeSelectKit<cr>", desc = "CMake: Select Kit" },
    { "<leader>mr", "<cmd>CMakeRun<cr>", desc = "CMake: Run" },
    { "<leader>mR", "<cmd>CMakeRunCurrentFile<cr>", desc = "CMake: Run File" },
    { "<leader>md", "<cmd>CMakeDebug<cr>", desc = "CMake: Debug" },
    { "<leader>mD", "<cmd>CMakeDebugCurrentFile<cr>", desc = "CMake: Debug File" },
    { "<leader>ms", "<cmd>CMakeStop<cr>", desc = "CMake: Stop" },
    { "<leader>mE", "<cmd>CMakeEditCache<cr>", desc = "CMake: Edit Cache" },
  },
}
