-- lua/plugins/cmake-tools.lua

return {
  "Civitasv/cmake-tools.nvim",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "folke/which-key.nvim",
  },

  keys = {
    { "<leader>cg", "<cmd>CMakeGenerate!<cr>", desc = "CMake: Generate native build system" },
    { "<leader>cb", "<cmd>CMakeBuild<cr>", desc = "CMake: Build Target" },
    { "<leader>cB", "<cmd>CMakeBuildCurrentFile<cr>", desc = "CMake: Build targets related to current file" },
    { "<leader>ct", "<cmd>CMakeSelectBuildTarget<cr>", desc = "CMake: Select Build Target" },
    { "<leader>ck", "<cmd>CMakeSelectKit<cr>", desc = "CMake: Select Kit (Compiler)" },
    { "<leader>cr", "<cmd>CMakeRun<cr>", desc = "CMake: Run Executable" },
    { "<leader>cd", "<cmd>CMakeDebug<cr>", desc = "CMake: Debug Executable" },
    { "<leader>cD", "<cmd>CMakeDebugCurrentFile<cr>", desc = "CMake: Debug targets related to current file." },
    { "<leader>cs", "<cmd>CMakeStop<cr>", desc = "CMake: Stop Process" },
    { "<leader>cR", "<cmd>CMakeCleanAndConfigure<cr>", desc = "CMake: Clean and Reconfigure" },
    { "<leader>cE", "<cmd>CMakeEditCache<cr>", desc = "CMake: Edit Cache" },
  },

  -- config = function()
  --   vim.notify("[CMake-Tools] My config function IS RUNNING!", vim.log.levels.WARN)
  --   require("cmake-tools").setup({
  --     cmake_build_directory = "build",
  --     cmake_build_tool = "ninja",
  --     cmake_regenerate_on_save = true,
  --     cmake_build_before_run = true,
  --     cmake_configure_args = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=ON" },
  --     telescope = {
  --       preview_location = "bottom",
  --     },
  --   })
  -- end,
}
