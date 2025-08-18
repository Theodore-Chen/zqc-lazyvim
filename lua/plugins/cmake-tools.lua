-- lua/plugins/cmake-tools.lua

return {
  "Civitasv/cmake-tools.nvim",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "folke/which-key.nvim",
  },

  keys = {
    { "<leader>mg", "<cmd>CMakeGenerate!<cr>", desc = "CMake: CMakeGenerate!" },
    { "<leader>mb", "<cmd>CMakeBuild<cr>", desc = "CMake: CMakeBuild" },
    { "<leader>mB", "<cmd>CMakeBuildCurrentFile<cr>", desc = "CMake: CMakeBuildCurrentFile" },
    { "<leader>mt", "<cmd>CMakeSelectBuildTarget<cr>", desc = "CMake: CMakeSelectBuildTarget" },
    { "<leader>mk", "<cmd>CMakeSelectKit<cr>", desc = "CMake: CMakeSelectKit" },
    { "<leader>mr", "<cmd>CMakeRun<cr>", desc = "CMake: CMakeRun" },
    { "<leader>mR", "<cmd>CMakeRunCurrentFile<cr>", desc = "CMake: CMakeRunCurrentFile" },
    { "<leader>md", "<cmd>CMakeDebug<cr>", desc = "CMake: CMakeDebug" },
    { "<leader>mD", "<cmd>CMakeDebugCurrentFile<cr>", desc = "CMake: CMakeDebugCurrentFile" },
    { "<leader>ms", "<cmd>CMakeStop<cr>", desc = "CMake: CMakeStop" },
    { "<leader>mE", "<cmd>CMakeEditCache<cr>", desc = "CMake: CMakeEditCache" },
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
